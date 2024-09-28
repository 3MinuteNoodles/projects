import os
import time
import subprocess

CODE_DIR = "../commands/"
global sleep_time

def main():
    global sleep_time
    sleep_time = 60
    file_list = []
    #this check regularly for new files from git
    while True:
        os.system("git pull")
        file_list = os.listdir(CODE_DIR)
        #runs a command for every line in each .command file
        for file in file_list:
            if file[file.find("."):len(file)] == ".command":
                execute_file(file)
                os.system("git rm " + CODE_DIR + file)
        os.system("git add " + CODE_DIR + "*")
        os.system("git add -u")
        os.system("git commit -m \"auto commit\"")
        os.system("git push")
        time.sleep(sleep_time)
                    
def execute_file(file):
    global sleep_time
    #opens a read and write file
    open_file = open(CODE_DIR + file, "r+")
    write_file = open(CODE_DIR + file[0:file.find(".")] + ".out", "w+")
    
    for line in open_file:
		#stripping the line so it is easier to work with
        line = line.strip()
        if (line == "slp"):
            write_file.write(str(sleep_time) + "\n")
        elif (line[0:4] == "slp "):
            sleep_time = int(line[4:len(line)])
        elif (line.find(" rm ") > -1 or line[0:3] == "rm "):
            if (line.find("plex") > 0):
                try:
                    write_file.write(subprocess.check_output(line, shell = True, text = True) + "\n")
                except:
                    write_file.write("command failed\n")
        else:
            try:
                write_file.write(subprocess.check_output(line, shell = True, text = True) + "\n")
            except:
                write_file.write("command failed\n")
    
    open_file.close
    write_file.close
    
if __name__ == "__main__":
    main()

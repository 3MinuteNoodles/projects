public class CountPrimes
{
    public static void main(String[] args)
    {
        int n = Integer.parseInt(args[0]);
        int count = 0;
        for (int i = 2; i <= n; i++)
        {
            if (i == 2) count++;
            else
            {
                boolean isPrime = true;
                if (!(i % 2 == 0))
                {
                    for (int j = 3; j < i; j += 2)
                    {
                        if (i % j == 0)
                        {
                            isPrime = false;
                            break;
                        }
                    }
                }
                else isPrime = false;
                if (isPrime) count++;
            }
        }
        System.out.println(count);
    }
}

using System;
using System.Threading.Tasks;

namespace SimpleLib
{
    public class SimpleType
    {
        public void Hi(string greeting) =>
            Console.WriteLine(greeting);

        public async Task Delay(int millisecondsDelay) =>
            await Task.Delay(millisecondsDelay);
    }
}

using System;
using System.Threading.Tasks;
using SimpleLib;

namespace MultiFileAssembly
{
    public class PartThree
    {
        public async Task Delay()
        {
            Console.WriteLine("Delay from PartThree!");
            await new SimpleType().Delay(2000);
        }
    }
}

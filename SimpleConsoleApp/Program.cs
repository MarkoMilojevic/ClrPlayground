using MultiFileAssembly;
using StronglyNamedAssembly;

namespace SimpleConsoleApp
{
    public static class Program
    {
        public static void Main(string[] args)
        {
            SimplePublicType simplePublicType = new SimplePublicType();
            simplePublicType.HiPublic();

            SimplePublicType.HiPublicStatic();

            simplePublicType.Delay().Wait();

            SimpleInternalType simpleInternalType = new SimpleInternalType();
            simpleInternalType.HiPublic();

            SimpleInternalType.HiPublicStatic();

            new PartThree().Delay().Wait();

            new PartOne().Hi();
            new PartTwo().Hi();

            StronglyNamedType.StrongHi();
        }
    }
}

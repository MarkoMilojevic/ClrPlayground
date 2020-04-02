using MultiFileAssembly;
using StronglyNamedAssembly;
using System;

namespace SimpleConsoleApp
{
    public static class Program
    {
        static Program()
        {
            AppDomain currentDomain = AppDomain.CurrentDomain;
            currentDomain.AssemblyLoad += new AssemblyLoadEventHandler(MyAssemblyLoadEventHandler);
        }

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

            StrongHi();
        }

        private static void MyAssemblyLoadEventHandler(object sender, AssemblyLoadEventArgs args) =>
            Console.WriteLine($"Assembly loaded: {args.LoadedAssembly.FullName}, Sender: {sender}");

        private static void StrongHi() =>
            new StronglyNamedType().StrongHi();
    }
}

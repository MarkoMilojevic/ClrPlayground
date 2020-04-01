using System;

namespace SimpleConsoleApp
{
    internal class SimpleInternalType
    {
        public const string _privateReadonlyGreeting = "Hi from internal public const greeting!";
        public readonly string _publicReadonlyGreeting = "Hi from internal public readonly greeting!";

        private const string PrivateConstGreeting = "Hi from internal private const greeting!";
        private readonly string _privateConstGreeting = "Hi from internal private readonly greeting!";

        public static void HiPublicStatic() =>
            Console.WriteLine(_privateReadonlyGreeting);

        public void HiPublic() =>
            Console.WriteLine(_publicReadonlyGreeting);

        private static void HiPrivateStatic() =>
            Console.WriteLine(PrivateConstGreeting);

        private void HiPrivate() =>
            Console.WriteLine(_privateConstGreeting);
    }
}

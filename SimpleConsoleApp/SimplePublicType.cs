using SimpleLib;
using System;
using System.Threading.Tasks;

namespace SimpleConsoleApp
{
    public class SimplePublicType
    {
        public const string _privateReadonlyGreeting = "Hi from public const greeting!";
        public readonly string _publicReadonlyGreeting = "Hi from public readonly greeting!";
        
        private const string PrivateConstGreeting = "Hi from private const greeting!";
        private readonly string _privateConstGreeting = "Hi from private readonly greeting!";

        private readonly int _millisecondsDelay = 2000;

        public static void HiPublicStatic() =>
            Console.WriteLine(_privateReadonlyGreeting);
        
        public void HiPublic() =>
            Console.WriteLine(_publicReadonlyGreeting);

        public async Task Delay() =>
            await new SimpleType().Delay(_millisecondsDelay);

        private static void HiPrivateStatic() =>
            Console.WriteLine(PrivateConstGreeting);
        
        private void HiPrivate() =>
            Console.WriteLine(_privateConstGreeting);

        private class SimplePrivateType
        {
            public const string _privateReadonlyGreeting = "Hi from public const greeting!";
            public readonly string _publicReadonlyGreeting = "Hi from public readonly greeting!";

            private const string PrivateConstGreeting = "Hi from private const greeting!";
            private readonly string _privateConstGreeting = "Hi from private readonly greeting!";

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
}

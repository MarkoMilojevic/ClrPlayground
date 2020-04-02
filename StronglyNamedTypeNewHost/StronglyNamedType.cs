using System;
using System.Runtime.CompilerServices;

namespace StronglyNamedAssembly
{
    [TypeForwardedFrom("StronglyNamedAssembly, Version=1.0.0.0, Culture=neutral, PublicKeyToken=5fdd701af783c79c")]
    public class StronglyNamedType
    {
        public void StrongHi() =>
            Console.WriteLine("Hi from GAC and from new host DLL!");
    }
}

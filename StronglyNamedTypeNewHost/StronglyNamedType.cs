using System;
using System.Runtime.CompilerServices;

namespace StronglyNamedAssembly
{
    [TypeForwardedFrom("StronglyNamedAssembly, Version=2.0.0.0, Culture=neutral, PublicKeyToken=5fdd701af783c79c")]
    public class StronglyNamedType
    {
        public void StrongHi() =>
            throw new NotSupportedException("StronglyNamedTypeNewHost does not support greetings.");
    }
}

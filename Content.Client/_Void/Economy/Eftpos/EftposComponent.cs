using Content.Shared._Void.Economy.Eftpos;

namespace Content.Client._Void.Economy.Eftpos;

[RegisterComponent]
[Access(typeof(EftposSystem))]
public sealed partial class EftposComponent : SharedEftposComponent
{
}

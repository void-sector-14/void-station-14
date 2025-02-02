using Content.Shared._Horizon.Economy.Eftpos;

namespace Content.Client._Horizon.Economy.Eftpos;

[RegisterComponent]
[Access(typeof(EftposSystem))]
public sealed partial class EftposComponent : SharedEftposComponent
{
}

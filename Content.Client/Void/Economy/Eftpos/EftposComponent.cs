using Content.Shared.Void.Economy.Eftpos;

namespace Content.Client.Void.Economy.Eftpos;

[RegisterComponent]
[Access(typeof(EftposSystem))]
public sealed partial class EftposComponent : SharedEftposComponent
{
}

using Content.Shared.Void.Economy;

namespace Content.Server.Void.Economy;

[RegisterComponent]
public sealed partial class BankMemoryComponent : Component
{
    public string AccountNumber => BankAccount?.Comp.AccountNumber ?? "";
    public string AccountPin => BankAccount?.Comp.AccountPin ?? "";
    public Entity<BankAccountComponent>? BankAccount { get; set; }
}

using Content.Shared._Void.Economy;
using Content.Shared.FixedPoint;

namespace Content.Server._Void.CartridgeLoader.Cartridges;

[RegisterComponent]
public sealed partial class BankCartridgeComponent : Component
{
    [ViewVariables] public BankAccountComponent? LinkedBankAccount { get; set; }
    [ViewVariables] public string? BankAccountNumber;
    [ViewVariables] public string? BankAccountPin;
    [ViewVariables] public string? BankAccountName;
    [ViewVariables] public FixedPoint2? BankAccountBalance;
}
public sealed class ChangeBankAccountBalanceEvent : EntityEventArgs
{
    public readonly FixedPoint2? ChangeAmount;
    public readonly FixedPoint2? NewBalance;
    public ChangeBankAccountBalanceEvent(FixedPoint2? changeAmount, FixedPoint2? newBalance)
    {
        ChangeAmount = changeAmount;
        NewBalance = newBalance;
    }
}

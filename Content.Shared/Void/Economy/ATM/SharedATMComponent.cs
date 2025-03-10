﻿using Content.Shared.Containers.ItemSlots;
using Content.Shared.FixedPoint;
using Content.Shared.Store;
using Robust.Shared.Audio;
using Robust.Shared.GameStates;
using Robust.Shared.Serialization;
using Robust.Shared.Serialization.TypeSerializers.Implementations.Custom.Prototype.Set;

namespace Content.Shared.Void.Economy.ATM;

[NetworkedComponent, RegisterComponent]
public sealed partial class AtmComponent : Component
{
    public static string IdCardSlotId = "IdCardSlot";

    [DataField("idCardSlot")]
    public ItemSlot IdCardSlot = new();

    [DataField("offState")]
    public string? OffState;
    [DataField("normalState")]
    public string? NormalState;

    [ViewVariables(VVAccess.ReadOnly), DataField("currencyWhitelist", customTypeSerializer: typeof(PrototypeIdHashSetSerializer<CurrencyPrototype>))]
    public HashSet<string> CurrencyWhitelist = new();

    [DataField("soundInsertCurrency")]
    public SoundSpecifier SoundInsertCurrency = new SoundPathSpecifier("/Audio/Effects/thunk.ogg");
    [DataField("soundWithdrawCurrency")]
    public SoundSpecifier SoundWithdrawCurrency = new SoundPathSpecifier("/Audio/Effects/thunk.ogg");
    [DataField("soundApply")]
    public SoundSpecifier SoundApply = new SoundPathSpecifier("/Audio/Machines/chime.ogg");
    [DataField("soundDeny")]
    public SoundSpecifier SoundDeny = new SoundPathSpecifier("/Audio/Machines/airlock_deny.ogg");
}

[Serializable, NetSerializable]
public sealed class AtmBoundUserInterfaceBalanceState : BoundUserInterfaceState
{
    public readonly FixedPoint2? BankAccountBalance;
    public readonly string? CurrencySymbol;
    public AtmBoundUserInterfaceBalanceState(
        FixedPoint2? bankAccountBalance,
        string? currencySymbol)
    {
        BankAccountBalance = bankAccountBalance;
        CurrencySymbol = currencySymbol;
    }
}

[Serializable, NetSerializable]
public sealed class AtmBoundUserInterfaceState : BoundUserInterfaceState
{
    public readonly bool IsCardPresent;
    public readonly string? IdCardFullName;
    public readonly string? IdCardEntityName;
    public readonly string? IdCardStoredBankAccountNumber;
    public readonly bool HaveAccessToBankAccount;
    public readonly FixedPoint2? BankAccountBalance;
    public readonly string? CurrencySymbol;
    public AtmBoundUserInterfaceState(
        bool isCardPresent,
        string? idCardFullName,
        string? idCardEntityName,
        string? idCardStoredBankAccountNumber,
        bool haveAccessToBankAccount,
        FixedPoint2? bankAccountBalance,
        string? currencySymbol)
    {
        IsCardPresent = isCardPresent;
        IdCardFullName = idCardFullName;
        IdCardEntityName = idCardEntityName;
        IdCardStoredBankAccountNumber = idCardStoredBankAccountNumber;
        HaveAccessToBankAccount = haveAccessToBankAccount;
        BankAccountBalance = bankAccountBalance;
        CurrencySymbol = currencySymbol;
    }
}

[Serializable, NetSerializable]
public enum ATMVisuals
{
    VisualState
}

[Serializable, NetSerializable]
public enum ATMVisualState
{
    Normal,
    Off
}

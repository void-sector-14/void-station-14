ent-BaseMechPart = { "" }
    .desc = { "" }
    .suffix = { "" }

ent-BaseRipleyPart = { ent-BaseMechPart }
    .desc = { ent-BaseMechPart.desc }
    .suffix = { ent-BaseMechPart.suffix }

ent-BaseRipleyPartItem = { ent-BaseRipleyPart }
    .desc = { ent-BaseRipleyPart.desc }
    .suffix = { ent-BaseRipleyPart.suffix }

ent-RipleyHarness = каркас Рипли
    .desc = Ядро меха Рипли АТМЕ.
    .suffix = { ent-BaseRipleyPart.suffix }

ent-RipleyLArm = левая рука Рипли
    .desc = Левая рука меха Рипли АТМЕ. Устанавливается на шасси меха.
    .suffix = { ent-BaseRipleyPartItem.suffix }

ent-RipleyLLeg = левая нога Рипли
    .desc = Левая нога меха Рипли АТМЕ. Устанавливается на шасси меха.
    .suffix = { ent-BaseRipleyPartItem.suffix }

ent-RipleyRLeg = правая нога Рипли
    .desc = Правая нога меха Рипли АТМЕ. Устанавливается на шасси меха.
    .suffix = { ent-BaseRipleyPartItem.suffix }

ent-RipleyRArm = правая рука Рипли
    .desc = Правая рука меха Рипли АТМЕ. Устанавливается на шасси меха.
    .suffix = { ent-BaseRipleyPartItem.suffix }

ent-RipleyChassis = шасси Рипли
    .desc = Незавершённое шасси меха Рипли АТМЕ.
    .suffix = { ent-BaseRipleyPart.suffix }

ent-BaseHonkerPart = { ent-BaseMechPart }
    .desc = { ent-BaseMechPart.desc }
    .suffix = { ent-BaseMechPart.suffix }

ent-BaseHonkerPartItem = { ent-BaseHonkerPart }
    .desc = { ent-BaseHonkerPart.desc }
    .suffix = { ent-BaseHonkerPart.suffix }

ent-HonkerHarness = каркас Х.О.Н.К.
    .desc = Ядро меха Х.О.Н.К.
    .suffix = { ent-BaseHonkerPart.suffix }

ent-HonkerLArm = левая рука Х.О.Н.К.
    .desc = Левая рука меха Х.О.Н.К., с уникальными гнёздами, в которые можно поместить странное оружие, разработанное учёными-клоунами.
    .suffix = { ent-BaseHonkerPartItem.suffix }

ent-HonkerLLeg = левая нога Х.О.Н.К.
    .desc = Левая нога меха Х.О.Н.К. Нога кажется достаточно большой, чтобы полностью поместиться в клоунской туфле.
    .suffix = { ent-BaseHonkerPartItem.suffix }

ent-HonkerRLeg = правая нога Х.О.Н.К.
    .desc = Правая нога меха Х.О.Н.К. Нога кажется достаточно большой, чтобы полностью поместиться в клоунской туфле.
    .suffix = { ent-BaseHonkerPartItem.suffix }

ent-HonkerRArm = правая рука Х.О.Н.К.
    .desc = Правая рука меха Х.О.Н.К., с уникальными гнёздами, в которые можно поместить странное оружие, разработанное учёными-клоунами.
    .suffix = { ent-BaseHonkerPartItem.suffix }

ent-HonkerChassis = шасси Х.О.Н.К.
    .desc = Незавершённое шасси меха Х.О.Н.К. Содержит блок хиханек, бананиумовое ядро, и систему хонкообеспечения.
    .suffix = { ent-BaseHonkerPart.suffix }

ent-BaseHamtrPart = { ent-BaseMechPart }
    .desc = { ent-BaseMechPart.desc }
    .suffix = { ent-BaseMechPart.suffix }

ent-BaseHamtrPartItem = { ent-BaseHamtrPart }
    .desc = { ent-BaseHamtrPart.desc }
    .suffix = { ent-BaseHamtrPart.suffix }

ent-HamtrHarness = каркас ХАМЯК
    .desc = Ядро меха ХАМЯК.
    .suffix = { ent-BaseHamtrPart.suffix }

ent-HamtrLArm = левая рука ХАМЯК
    .desc = Левая рука меха ХАМЯК. Устанавливается на шасси меха.
    .suffix = { ent-BaseHamtrPartItem.suffix }

ent-HamtrLLeg = левая нога ХАМЯК
    .desc = Левая нога меха ХАМЯК. Устанавливается на шасси меха.
    .suffix = { ent-BaseHamtrPartItem.suffix }

ent-HamtrRLeg = правая нога ХАМЯК
    .desc = Правая нога меха ХАМЯК. Устанавливается на шасси меха.
    .suffix = { ent-BaseHamtrPartItem.suffix }

ent-HamtrRArm = правая рука ХАМЯК
    .desc = Правая рука меха ХАМЯК. Устанавливается на шасси меха.
    .suffix = { ent-BaseHamtrPartItem.suffix }

ent-HamtrChassis = шасси ХАМЯК
    .desc = Незавершённое шасси меха ХАМЯК.
    .suffix = { ent-BaseHamtrPart.suffix }

ent-BaseVimPart = { ent-BaseMechPart }
    .desc = { ent-BaseMechPart.desc }
    .suffix = { ent-BaseMechPart.suffix }

ent-BaseVimPartItem = { ent-BaseVimPart }
    .desc = { ent-BaseVimPart.desc }
    .suffix = { ent-BaseVimPart.suffix }

ent-VimHarness = каркас ВИМ
    .desc = Небольшой кронштейн для крепления частей ВИМ.
    .suffix = { ent-BaseVimPartItem.suffix }

ent-VimChassis = шасси ВИМ
    .desc = Незавершённое шасси меха ВИМ.
    .suffix = { ent-BaseVimPart.suffix }

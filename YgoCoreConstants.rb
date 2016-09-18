# encoding: UTF-8
# ygocore constants

module YGOCoreConstants
	module Attribute
		Earth = 0x01
		Water = 0x02
		Fire = 0x04
		Wind = 0x08
		Light = 0x10
		Dark = 0x20
		Divine = 0x40
	end

	module Race
		None = 0
		Warrior = 0x1         # 战士
		SpellCaster = 0x2     # 魔法使
		Fairy = 0x4           # 天使
		Fiend = 0x8           # 恶魔
		Zombie = 0x10         # 不死
		Machine = 0x20        # 机械
		Aqua = 0x40           # 水
		Pyro = 0x80           # 炎
		Rock = 0x100          # 岩石
		WindBeast = 0x200     # 鸟兽
		Plant = 0x400         # 植物
		Insect = 0x800        # 昆虫
		Thunder = 0x1000      # 雷
		Dragon = 0x2000       # 龙 
		Beast = 0x4000        # 兽 
		BeastWarrior = 0x8000 # 兽战士
		Dinasour = 0x10000    # 恐龙
		Fish = 0x20000        # 鱼
		Seaserpent = 0x40000  # 海龙
		Reptile = 0x80000     # 爬虫
		Psycho = 0x100000     # 念动力
		Devine = 0x200000     # 幻兽神
		Creatorgod = 0x400000 # 创世神
		Wyrm = 0x800000       # 幻龙
	end

	module Rule
		None = 0
		Ocg = 1
		Tcg = 2
		OT = 3
		DIY = 4
	end

	module Type
		Monster = 0x1         # 怪兽
		Spell = 0x2           # 魔法
		Trap = 0x4            # 陷阱
		Normal = 0x10         # 通常
		Effect = 0x20         # 效果
		Fusion = 0x40         # 融合
		Ritual = 0x80         # 仪式
		TrapMonster = 0x100   # 陷阱怪兽
		Spirit = 0x200        # 灵魂
		Union = 0x400         # 同盟
		Dual = 0x800          # 二重
		Tuner = 0x1000        # 调整
		Synchro = 0x2000      # 同调
		Token = 0x4000        # 衍生物
		Quickplay = 0x10000   # 速攻
		Continuous = 0x20000  # 永续
		Equip = 0x40000       # 装备
		Field = 0x80000       # 场地
		Counter = 0x100000    # 反击
		Flip = 0x200000       # 反转
		Cartoon = 0x400000    # 卡通
		Xyz = 0x800000        # Xyz
		Pendulum = 0x1000000  # 灵摆
	end

	PendulumLeftMod = 65536
	PendulumRightMod = 16777216
	QuestionMark = -2
end

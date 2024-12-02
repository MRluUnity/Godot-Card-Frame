#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
extends Node

# TODO 卡牌管理器 ===============>信 号<===============
#region 信号

#endregion

# TODO 卡牌管理器 ===============>常 量<===============
#region 常量
const CARD_PANEL = preload("res://scene/ui/card_panel.tscn")
#endregion

# TODO 卡牌管理器 ===============>变 量<===============
#region 变量
var card_group : CardGroup
#endregion

# TODO 卡牌管理器 ===============>虚方法<===============
#region 常用的虚方法
func _init() -> void:
	pass

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

func _physics_process(_delta: float) -> void:
	pass

func _input(_event: InputEvent) -> void:
	pass

func _unhandled_input(_event: InputEvent) -> void:
	pass
#endregion

# TODO 卡牌管理器 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 卡牌管理器 ===============>工具方法<===============
#region 工具方法

#endregion

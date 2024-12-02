#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name CardPanel extends PanelContainer

# TODO 卡牌面板UI ===============>信 号<===============
#region 信号

#endregion

# TODO 卡牌面板UI ===============>常 量<===============
#region 常量

#endregion

# TODO 卡牌面板UI ===============>变 量<===============
#region 变量
var tween_is_running : bool = false
var tween : Tween
#endregion

# TODO 卡牌面板UI ===============>虚方法<===============
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

# TODO 卡牌面板UI ===============>信号链接方法<===============
#region 信号链接方法
func _on_mouse_entered() -> void:
	tween_is_running = true
	tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC).set_parallel()
	tween.tween_property(self, "scale", Vector2.ONE * 1.2, .25)
	tween.tween_property(self, "position:y",  -64, .25)
	tween.tween_property(self, "rotation_degrees", 0, .25)
	z_index = 100


func _on_mouse_exited() -> void:
	tween= create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "scale", Vector2.ONE, .25)
	tween.tween_property(self, "position:y",  -0, .25)
	z_index = get_index()


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			queue_free()
#endregion

# TODO 卡牌面板UI ===============>工具方法<===============
#region 工具方法

#endregion

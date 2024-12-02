#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name CardGroup extends Control

# TODO name ===============>信 号<===============
#region 信号

#endregion

# TODO name ===============>常 量<===============
#region 常量

#endregion

# TODO name ===============>变 量<===============
#region 变量
@export var reset_card_count : float:
	set(v):
		reset_card_count = v
		update_card_group()

@export var card_offset_x : float
#endregion

# TODO name ===============>虚方法<===============
#region 常用的虚方法
func _init() -> void:
	pass

func _ready() -> void:
	CardManager.card_group = self
	reset_card_group()

func _process(_delta: float) -> void:
	pass

func _physics_process(_delta: float) -> void:
	pass

func _input(_event: InputEvent) -> void:
	pass

func _unhandled_input(_event: InputEvent) -> void:
	pass
#endregion

# TODO name ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO name ===============>工具方法<===============
#region 工具方法
func reset_card_group() -> void:
	for i in get_children():
		i.queue_free()

	for i in reset_card_count:
		var card_panel : CardPanel = CardManager.CARD_PANEL.instantiate()
		add_child(card_panel)
		card_panel.position.x = 1280

		var tween : Tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC).set_parallel()
		card_offset_x = -((reset_card_count - 10) * 128) / (reset_card_count - 1)

		var final_pos : Vector2 = Vector2((128 + card_offset_x) * i, 0)

		tween.tween_property(card_panel, "position", final_pos, .5 + (i * .0075))

func update_card_group() -> void:
	var current_child_size = get_child_count()
	print("当前子节点：%s，当前余剩卡牌：%s" % [current_child_size, reset_card_count])
	if current_child_size < reset_card_count:
		for i in reset_card_count - current_child_size:
			var card_panel : CardPanel = CardManager.CARD_PANEL.instantiate()
			add_child(card_panel)
			card_panel.position.x = 1280

	for i in get_child_count():
		var tween : Tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC).set_parallel()
		card_offset_x = -((reset_card_count - 10) * 128) / (reset_card_count - 1)

		var final_pos : Vector2 = Vector2((128 + card_offset_x) * i, 0)

		if get_child_count() == 1:
			final_pos.x = 608

		tween.tween_property(get_child(i), "position", final_pos, .5 + (i * .0075))
#endregion


func _on_gui_input(event: InputEvent) -> void:
	print(event)


func _on_button_pressed() -> void:
	reset_card_count += 1
	update_card_group()

func _on_child_order_changed() -> void:
	if get_child_count() == 0: return
	reset_card_count = get_child_count()

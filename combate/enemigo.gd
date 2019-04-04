extends AnimatedSprite
var per=1
onready var vida=get_node("../prota"+str(per)+"/valores_aliados/constantes/vida/barra1/PS")
onready var vida_actual_num=get_node("../prota"+str(per)+"/valores_aliados/constantes/vida/barra1/contenedor/fondo/valor")
onready var magia=get_node("valores_enemigos/constantes/magia/barra2/PM")
onready var magia_actual_num=get_node("valores_enemigos/constantes/magia/barra2/contenedor/fondo/valor")
func _ready():
	var vida=get_node("../prota"+str(per)+"/valores_aliados/constantes/vida/barra1/PS")
	var vida_actual_num=get_node("../prota"+str(per)+"/valores_aliados/constantes/vida/barra1/contenedor/fondo/valor")
	pass




func medir_vida(delta):
	if delta<=0:
		get_node("../prota"+str(per)).play("death")
	else:
		per=(per%2)+1
		get_node("../prota"+str(per)+"/menu_accion").visible=true
	

func turno_enemigo(personaje):
	per=personaje
	_ready()
	var tipo_ataque=int(rand_range(1,3))
	if magia.value<5:
		tipo_ataque=1
	if tipo_ataque==1:
		vida.set_value(vida.value-rand_range(8,12) )
		vida_actual_num.set_text(String(vida.get_value()))
		medir_vida(vida.value)
	if tipo_ataque==2:
		vida.set_value(vida.value-10 )
		vida_actual_num.set_text(String(vida.get_value()))
		magia.set_value(magia.value-5)
		magia_actual_num.set_text(String(magia.get_value()))
		medir_vida(vida.value)
	pass # Replace with function body.







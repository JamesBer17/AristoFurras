extends Area2D

func _ready():
	# Conectar la señal para detectar la colisión
	connect("area_entered", self, "_on_area_entered")

# Función que se llamará cuando una poción entre en el área de destino
func _on_area_entered(area):
	if area.name == "Poción":
		print("¡La poción ha llegado a su destino!")
		# Aquí puedes añadir lógica para verificar si es la poción correcta

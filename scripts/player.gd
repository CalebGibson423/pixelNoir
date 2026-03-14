extends CharacterBody2D

const SPEED = 150.0;
var last_direction := "down"
var idle = true;
var last_frame := -1

var zoom_speed := 0.2
var min_zoom := 2.0
var max_zoom := 5.0


@onready var sprite = $AnimatedSprite2D
@onready var camera = $Camera2D

func _physics_process(_delta: float) -> void:

	# converts inputs into vector for consistent speed
	var direction := Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * SPEED

	footstep_sounds()	
	update_animation(direction)
	move_and_slide()
	handle_zoom()

# x animations -> y animations -> idle animations
func update_animation(direction):

	# X animations
	if direction.x != 0:
		idle = false
		play_anim("RunRight")
		sprite.flip_h = direction.x < 0;
		
		# track last direction
		if direction.x < 0:
			last_direction = "left"
		else:
			last_direction = "right"
	
	# Y animations
	elif direction.y != 0:
		idle = false
		if direction.y < 0:
			play_anim("RunUp")
			last_direction = "up"
		else:
			play_anim("RunDown")
			last_direction = "down"
			
	# Idle animations
	else:
		idle = true
		match last_direction:
			"left":
				play_anim("IdleRight")
				sprite.flip_h = true
			"right":
				play_anim("IdleRight")
				sprite.flip_h = false
			"up":
				play_anim("IdleUp")
			"down":
				play_anim("IdleDown")
				
func handle_zoom():
	
	if Input.is_action_just_pressed("zoom_out"):
		camera.zoom -= Vector2(zoom_speed, zoom_speed)
	if Input.is_action_just_pressed("zoom_in"):
		camera.zoom += Vector2(zoom_speed, zoom_speed)
	
	camera.zoom = camera.zoom.clamp(
		Vector2(min_zoom, min_zoom),
		Vector2(max_zoom, max_zoom)
	)
	
# only plays animation if its not already playing
func play_anim(anim):
	if sprite.animation != anim:
		sprite.play(anim)
		
func footstep_sounds():
	if sprite.animation.begins_with("Run"):
		var current_frame = sprite.frame
		
		if current_frame != last_frame:
			var step_frames = []
			
			match sprite.animation:
				"RunDown":
					step_frames = [2, 5]
				"RunUp", "RunRight":
					step_frames = [1, 4] 
				
			if current_frame in step_frames:
				SfxManager.play_pitch("Footsteps5")
				
			last_frame = current_frame
	else:
		last_frame = -1

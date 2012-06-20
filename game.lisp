(ql:quickload "lispbuilder-sdl")

(defclass game-object ()
  sprite
  pos
)

(defclass actor (game-object)
 action
 health
 direction
)

(defclass sprite ()
  sprite-sheet
  grid-size
  nframes
  pos
)
(defgeneric increment (sprite)
  (:documentation "Step a game object one frame"))

(defmethod increment (
  
(sdl:with-init ()
  (sdl:window 640 480 :FPS (make-instance '(sdl:fps-fixed :target-frame-rate 8)))
  (sdl:draw-surface (sdl:load-image "LPC_art/male_walkcycle.png"))
  (sdl:update-display)
  (sdl:with-events (:poll)
    (:quit-event () t)
    (:video-expose-event () (sdl:update-display))))
    (:idle() (sprite:step ())


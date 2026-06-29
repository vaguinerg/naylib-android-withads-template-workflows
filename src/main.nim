# ****************************************************************************************
#
#   raylib game template
#
#   <Game title>
#   <Game description>
#
#   This game has been created using raylib (www.raylib.com)
#   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
#
#   Copyright (c) 2021 Ramon Santamaria (@raysan5)
#
# ****************************************************************************************

import raylib, ./admob

when not defined(android):
  import std/os
  setCurrentDir getAppDir()

const
  screenWidth = 800
  screenHeight = 600

initWindow(screenWidth, screenHeight, "3D do zero")
setTargetFPS(60)

# câmera
var camera = Camera3D(
  position: Vector3(x: 0, y: 2, z: 6), # onde a câmera está
  target: Vector3(x: 0, y: 1, z: 0),   # para onde olha
  up: Vector3(x: 0, y: 1, z: 0),       # qual direção é "cima"
  fovy: 60,
  projection: Perspective
)

# posição do cubo
var cubePos = Vector3(x: 0, y: 0.0, z: 0)
disableCursor()

while not windowShouldClose():

  cubePos.y += 0.01

  updateCamera(camera, CameraMode.FirstPerson)

  beginDrawing()

  clearBackground(RayWhite)

  beginMode3D(camera)

  # chão
  drawGrid(20, 1.0)

  # cubo
  drawCube(cubePos, 2, 2, 2, Red)

  # linhas do cubo
  drawCubeWires(cubePos, 2, 2, 2, Black)

  endMode3D()

  drawText("WASD para mover", 10, 10, 20, Black)

  endDrawing()

closeWindow()

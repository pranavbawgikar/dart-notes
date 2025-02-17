### `addPostFrameCallback` Method
`addPostFrameCallback` in Flutter is a method that schedules a callback to be executed after the current frame has been rendered, This is particularly useful when you need to perform actions that depend on the rendering being complete, such as updating the UI or triggering animations.

### `endOfFrame` 
The `endOfFrame` property in Flutter returns a `Future` that completes after the current frame's execution. It is used to schedule actions that should occur once the frame is fully rendered.
If called between the frames, it schedules a new frame and completes after that frame's execution.

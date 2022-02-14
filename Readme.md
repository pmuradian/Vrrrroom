![Vrrrroom](./Vrrrroom/readme_icon.png)

# Vrrrroom
Vrrrroom is an aplication that allows the user to perform remote actions on a car.

It consists of two functional areas
1. scrollable car selection area (implemented in CarCollectionView)
2. an area that contains actions that can be performed on a car (implemenetd in CarActionView)

Scrollable area displays car's name and milage on the top, and the car in the center.

Action area contains two actions
1. Door lock system: Contains buttons for locking and unlocking the doors.
2. Engine control system: Contains buttons for starting and stopping the engine.

## Use cases

The user is able to select a car from scrollable section and perform following actions on the car
1. lock/unlock doors
2. stop/start engine

Once acted on the car, the action resolved in 5 seconds either successfuly or with a falure. In both cases UI us updated correspondingly

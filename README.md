# 2d lua game engine 
this project is built on LOVE 2d game engine,
mainly just to hone skills but it is suitable for use 

<img src='https://cdn.discordapp.com/attachments/1158062262058225735/1253883225689030656/Base_Profile___Shot_with_GeForce.gif?ex=66777941&is=667627c1&hm=73735356182870a4c02d052a4878241f5236c83cf5ed993be7694c289e1c61dd&'>


## Run Locally

Install my-project with npm

- create environment
```bash
    mkdir my-project
```
- clone repo
```bash
    git clone https://github.com/MythicalMayhem/gameNgine
```
- install lua and make environment 
- install love 2d ([how to install](https://love2d.org/wiki/Getting_Started))
- ```bash 
    cd my-project 
    ```
- run with  ``` ALT + L```


# API Reference

## objects 

#### <ins> boxes </ins>
```lua
  boxes:new (canCollide,x,y,w,h,c)
```
###### (walls)
- canCollide : collidable or walk-through  
- x,y : position  
- w,h :  width / height  
- c : hitbox color {r,g,b,a} r,g,b,a in  [0,1]  
#### <ins> entities  </ins>
```lua
  entities:new (x,y,w,h,c)
```
###### (walls)
- canCollide : collidable or walk-through  
- x,y : position  
- w,h : hitbox width / height  
- c : hitbox color {r,g,b,a} r,g,b,a in  [0,1]  


## forces 
#### <ins> temporary impulse </ins>
```lua
  physics:applyImpulse(e,x,y,mag,res)
```
###### (jumping or knockback)
 - e   : the entity (player or npc)  
 - x,y : coordinates of the normalized vector  
 - mag : magnitude  
 - res : resistance, the rate of diminution   
#### <ins> constant force </ins>
```lua
  physics:linear(e,x,y,mag)
```
###### (gravity or flying )
- e   : the entity (player or npc)  
- x,y : coordinates of the normalized vector   
- mag : magnitude  
 
## Tweening 
#### <ins> create </ins>
```lua
local tw = tween:new(obj, { x = fromX, y = fromY }, { x = toX, y = toY }, seconds)
```
 
#### <ins> pause </ins>
```lua
tw:pause()
```
#### <ins> resume </ins>
```lua
tw:resume()
```
#### <ins> destroy </ins>
```lua
tw:destroy()
```
 
  
## Acknowledgements

 - [LOVE 2D](https://github.com/love2d/love) 

## Authors

- [@MythicalMayhem](https://github.com/MythicalMayhem)


## License

[MIT](https://choosealicense.com/licenses/mit/)


## Usage/Examples

```lua

```


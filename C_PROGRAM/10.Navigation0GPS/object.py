import re

class Object:
    def __init__(self,type,color,x,y):
        self.type = type
        self.color = color
        self.x = x
        self.y = y

Obj_list = []

with open("manh_0.sxp","r") as file:
    lines = file.readlines()
    for i,line in enumerate(lines):
        if len(line.split()) == 0 :
            continue
        parts = line.strip().split()
        
        if (parts[0] == '(house') or (parts[0] == '(big-house') or (parts[0] == '(vegetation') or (parts[0] == '(big-vegetation') :
            type = parts[0][1:]
            parts = lines[i+1].strip().split()
            color = parts[1][1:-2]
            parts = lines[i+2].strip().split()
            x = parts[1]
            y = parts[2][0:-1]
            ob = Object(type = type,color = color, x=x, y=y)
            Obj_list.append(ob)

print(f"Created {len(Obj_list)} instances:")
for ob in Obj_list:
    print(f"- {ob.type}: {ob.color}: ({ob.x},{ob.y})")


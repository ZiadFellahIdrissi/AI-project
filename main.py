from pyswip import Prolog
from tkinter import Tk,Label

root = Tk()
root.geometry("500x500")

p=Prolog()
p.consult("C:/Users/fella/Desktop/BD2C/IA/prolog/test.pl")

for i in p.query("parent(sara,X)"):
    Label(root,text=i["X"]).pack()


root.mainloop()
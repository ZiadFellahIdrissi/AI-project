from pyswip import Prolog
from tkinter import Tk,Label,Entry,Button

def get_it():
    but="parent("+my_text.get()+",X)"
    for i in p.query(but):
        Label(root,text=i["X"]).pack()


root = Tk()
root.geometry("500x500")

p=Prolog()
p.consult("C:/Users/fella/Desktop/BD2C/IA/prolog/test.pl")

# input
my_text = Entry(root,font=("Helvetica", 16) )
my_text.pack(pady="15", padx="10")

# button valider
Button(root,text="D'aaaaccord" ,command=get_it).pack()

root.mainloop()
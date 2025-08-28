def makefile(text, nooflines):
  nooflines = int(nooflines)
  with open("streakmaker.txt", "w") as f:
      for i in range(nooflines):
        f.write("text\n")

lines = input("how many lines?")
text = input("what text do you want placed")

makefile(text, lines)

     

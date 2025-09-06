def makefile(text, nooflines):
  nooflines = int(nooflines)
  with open("streakmaker.txt", "w") as f:
      for i in range(nooflines):
        f.write(f"{text}\n")

lines = 1
text = "im too tired to code"

makefile(text, lines)

     

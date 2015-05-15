lines_seen = set() # holds lines already seen
outfile = open("zzzzzz.sql", "w")
for line in open("cards-tables.sql", "r"):
    if line not in lines_seen: # not a duplicate
        outfile.write(line)
        lines_seen.add(line)
outfile.close()

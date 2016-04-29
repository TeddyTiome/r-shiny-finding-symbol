alzheimer = function(
    char1 = "D",char2 = "O",
    nr = 10, nc = 30, seed = NULL
) {
    panel <- matrix(rep(char1),nr,nc)
    set.seed(seed)
    i<-sample(1:nr,1)
    j<-sample(1:nc,1)
    panel[i,j]<-char2
    return(panel)
  }
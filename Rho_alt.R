Rho_alt <- function(x,y){
  temp <- as.matrix(table(x,y))
  tbl <-as.matrix(prop.table(temp))
  col_num <- dim(tbl)[2]
  if(col_num == 1){
    rho <- 0
    return(rho)
  }
  else if(col_num == 2){
    p11hat <-tbl[1,1]; p12hat <- tbl[1,2]
    p21hat <-tbl[2,1]; p22hat <- tbl[2,2]
    p31hat <-tbl[3,1]; p32hat <- tbl[3,2]
    p1p <- sum(tbl[1, ]); p2p <- sum(tbl[2, ]); p3p <- sum(tbl[3, ])
    pp1 <- sum(tbl[, 1]); pp2 <- sum(tbl[,2 ])
    rho <- p11hat^2/(p1p*pp1) + p12hat^2/(p1p*pp2) +
      p21hat^2/(p2p*pp1) + p22hat^2/(p2p*pp2)  +
      p31hat^2/(p3p*pp1) + p32hat^2/(p3p*pp2)  - 1
    return(rho)
  }
  else{
    p11hat <-tbl[1,1]; p12hat <- tbl[1,2]; p13hat <- tbl[1,3]
    p21hat <-tbl[2,1]; p22hat <- tbl[2,2]; p23hat <- tbl[2,3]
    p31hat <-tbl[3,1]; p32hat <- tbl[3,2]; p33hat <- tbl[3,3]
    
    
    p1p <- sum(tbl[1, ]); p2p <- sum(tbl[2, ]); p3p <- sum(tbl[3, ]) # row marginals
    pp1 <- sum(tbl[, 1]); pp2 <- sum(tbl[,2 ]); pp3 <- sum(tbl[ ,3]) # col marginals
    
    b11 <- p11hat/sqrt(p1p*pp1); b12 <- p12hat/sqrt(p1p*pp2); b13 <- p13hat/sqrt(p1p*pp3)
    b21 <- p21hat/sqrt(p2p*pp1); b22 <- p22hat/sqrt(p2p*pp2); b23 <- p23hat/sqrt(p2p*pp3)
    b31 <- p31hat/sqrt(p3p*pp1); b32 <- p32hat/sqrt(p3p*pp2); b33 <- p33hat/sqrt(p3p*pp3)
    
    bcells <- c(b11,b12,b13,b21,b22,b23,b31,b32,b33)
    if(sum(bcells)=="NaN"){
      rho <- 0
    }
    else{
      rho <- p11hat^2/(p1p*pp1) + p12hat^2/(p1p*pp2) + p13hat^2/(p1p*pp3) +
        p21hat^2/(p2p*pp1) + p22hat^2/(p2p*pp2) + p23hat^2/(p2p*pp3) +
        p31hat^2/(p3p*pp1) + p32hat^2/(p3p*pp2) + p33hat^2/(p3p*pp3) - 1
    }
    return(rho)
  }
}

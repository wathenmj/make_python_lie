Rho_frq <- function(frq_A_1, frq_A_2, frq_A_3){
  n_1 <- 113; n_2 <- 85; n_3 <- 113 # ceu, chd, yri
  n <- n_1 + n_2 + n_3
  r_1 <- n_1/n; r_2 <- n_2/n; r_3 <- n_3/n #row population proportions
  
  frq_a_1 <- 1 - frq_A_1; frq_a_2 <- 1 - frq_A_2; frq_a_3 <- 1 - frq_A_3
  t_1 <- r_1*c(frq_A_1^2, 2*frq_A_1*frq_a_1, frq_a_1^2)
  t_2 <- r_2*c(frq_A_2^2, 2*frq_A_2*frq_a_2, frq_a_2^2)
  t_3 <- r_3*c(frq_A_3^2, 2*frq_A_3*frq_a_3, frq_a_3^2)
  
  w <- append(t_1,t_2)
  w <- append(w,t_3)
  w <- matrix(w, nrow = 3, ncol = 3, byrow = T)
  
  col_num <- dim(w)[2]
  if(col_num == 1){
    rho <- 0
    return(rho)
  }
  else if(col_num == 2){
    p11 <-w[1,1]; p12 <- w[1,2]
    p21 <-w[2,1]; p22 <- w[2,2]
    p31 <-w[3,1]; p32 <- w[3,2]
    p1p <- sum(w[1, ]); p2p <- sum(w[2, ]); p3p <- sum(w[3, ])
    pp1 <- sum(w[, 1]); pp2 <- sum(w[,2 ])
    rho <- p11^2/(p1p*pp1) + p12^2/(p1p*pp2) +
      p21^2/(p2p*pp1) + p22^2/(p2p*pp2)  +
      p31^2/(p3p*pp1) + p32^2/(p3p*pp2)  - 1
    return(rho)
  }
  else{
    p11 <-w[1,1]; p12 <- w[1,2]; p13 <- w[1,3]
    p21 <-w[2,1]; p22 <- w[2,2]; p23 <- w[2,3]
    p31 <-w[3,1]; p32 <- w[3,2]; p33 <- w[3,3]
    
    
    p1p <- sum(w[1, ]); p2p <- sum(w[2, ]); p3p <- sum(w[3, ]) # row marginals
    pp1 <- sum(w[, 1]); pp2 <- sum(w[,2 ]); pp3 <- sum(w[ ,3]) # col marginals
    
    b11 <- p11/sqrt(p1p*pp1); b12 <- p12/sqrt(p1p*pp2); b13 <- p13/sqrt(p1p*pp3)
    b21 <- p21/sqrt(p2p*pp1); b22 <- p22/sqrt(p2p*pp2); b23 <- p23/sqrt(p2p*pp3)
    b31 <- p31/sqrt(p3p*pp1); b32 <- p32/sqrt(p3p*pp2); b33 <- p33/sqrt(p3p*pp3)
    
    bcells <- c(b11,b12,b13,b21,b22,b23,b31,b32,b33)
    if(sum(bcells)=="NaN"){
      rho <- 0
    }
    else{
      rho <- p11^2/(p1p*pp1) + p12^2/(p1p*pp2) + p13^2/(p1p*pp3) +
        p21^2/(p2p*pp1) + p22^2/(p2p*pp2) + p23^2/(p2p*pp3) +
        p31^2/(p3p*pp1) + p32^2/(p3p*pp2) + p33^2/(p3p*pp3) - 1
    }
    return(rho)
  }
}
.data
    vector: .word 5,1,2,6,5,5,6,7,9,10,11 #arr[]
    
.text
main:
    lui $s1, 0x1001 #direccion base del vector
    jal longitud_array #CalcularLongitudArray()
    lui $a0, 0x1001 #direccion base del vector en a0
    addi $a1, $s0, 0 #a1=longitud
    jal penultimo #Obtener penultimo elemento
    addi $a1, $v0, 0 #arg1 = valor penult y=x
    jal mult_function # function_multiplicacion()
    j fin_ejecucion #no seguir ejecutando
  
longitud_array: 
    lw  $a0, 0($s1) #a0=s1[i]
    beq $a0, 0, exit #if(i=0)exit 
    addi $s0, $s0, 1 # longitud=longitud +1
    addi $s1, $s1, 4 #dirección=dirección+4
    j longitud_array
    
exit: 
    jr $ra
    
penultimo:
    addi $t2, $zero, 8   # Cargar 8 en $t2
    sub $t1, $t1, $t2    # Restar 8 de $t1
    add $s1, $s1, $t1 # direccion del penultimo elemento
    lw $v0,0($s1) #cargamos en v0 el valor del penultimo elemento
    jr $ra 

mult_function:
    sll $t3, $a1, 6 #x * 64
    sll $t4, $a1, 4 #x * 16
    add $v1, $t3, $t4 #(x*64) + (x*16) = x*80
    jr $ra
    
fin_ejecucion: #finalizar el programa
    addi $v0, $zero,10
    syscall 

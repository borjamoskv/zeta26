(module
  (import "env" "print_char" (func $print_char (param i32)))
  (import "env" "print_num" (func $print_num (param i32)))
  (import "env" "read_char" (func $read_char (result i32)))
  (import "env" "read_num" (func $read_num (result i32)))
  
  (memory 32)
  
  (func (export "main")
    (local $sp i32)
    (local $temp i32)
    (local $addr i32)
    (local $val i32)
    (local $a i32)
    (local $b i32)
    
    ;; Initialize SP
    i32.const 0
    local.set $sp
    
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: V
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: I
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $b
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; push
    local.get $sp
    local.get $a
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: U
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; pop to $val
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $val
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    local.get $val
    i32.store
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: V
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: Q
    block
      loop
        local.get $sp
        i32.const 4
        i32.sub
        i32.load
        i32.eqz
        br_if 1
      ;; Inst: J
      local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
      ;; Inst: K
      local.get $sp
    i32.const 4
    i32.sub
    local.set $addr
    local.get $addr
    local.get $addr
    i32.load
    i32.const 1
    i32.add
    i32.store
      ;; Inst: H
          ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: H
          ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: V
          ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
          ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: G
          ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: G
          ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: A
          ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
          ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
          ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: G
          ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: A
          ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
          ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
          ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: G
          ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: A
          ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
          ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
          ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: A
          ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
          ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
          ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: I
          ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
          ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
          ;; push
    local.get $sp
    local.get $b
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
          ;; push
    local.get $sp
    local.get $a
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: U
          ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
          ;; pop to $val
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $val
      local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    local.get $val
    i32.store
      ;; Inst: H
          ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: V
          ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
          ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: Q
      block
      loop
        local.get $sp
        i32.const 4
        i32.sub
        i32.load
        i32.eqz
        br_if 1
        ;; Inst: J
        local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
        ;; Inst: K
        local.get $sp
    i32.const 4
    i32.sub
    local.set $addr
    local.get $addr
    local.get $addr
    i32.load
    i32.const 1
    i32.add
    i32.store
        ;; Inst: H
            ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: H
            ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: V
            ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
            ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: G
            ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: G
            ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: A
            ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
            ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
            ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: A
            ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
            ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
            ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: I
            ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
            ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
            ;; push
    local.get $sp
    local.get $b
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
            ;; push
    local.get $sp
    local.get $a
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: U
            ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
            ;; pop to $val
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $val
        local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    local.get $val
    i32.store
        ;; Inst: K
        local.get $sp
    i32.const 4
    i32.sub
    local.set $addr
    local.get $addr
    local.get $addr
    i32.load
    i32.const 1
    i32.add
    i32.store
        ;; Inst: H
            ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: H
            ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: V
            ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
            ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: G
            ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: G
            ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: A
            ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
            ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
            ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: G
            ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: A
            ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
            ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
            ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: A
            ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
            ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
            ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: I
            ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
            ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
            ;; push
    local.get $sp
    local.get $b
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
            ;; push
    local.get $sp
    local.get $a
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: U
            ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
            ;; pop to $val
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $val
        local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    local.get $val
    i32.store
        ;; Inst: K
        local.get $sp
    i32.const 4
    i32.sub
    local.set $addr
    local.get $addr
    local.get $addr
    i32.load
    i32.const 1
    i32.add
    i32.store
        ;; Inst: H
            ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: H
            ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: V
            ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
            ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: G
            ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: G
            ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: A
            ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
            ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
            ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: G
            ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: A
            ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
            ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
            ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: A
            ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
            ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
            ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: I
            ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
            ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
            ;; push
    local.get $sp
    local.get $b
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
            ;; push
    local.get $sp
    local.get $a
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: U
            ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
            ;; pop to $val
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $val
        local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    local.get $val
    i32.store
        ;; Inst: K
        local.get $sp
    i32.const 4
    i32.sub
    local.set $addr
    local.get $addr
    local.get $addr
    i32.load
    i32.const 1
    i32.add
    i32.store
        ;; Inst: H
            ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: H
            ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: V
            ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
            ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: K
        local.get $sp
    i32.const 4
    i32.sub
    local.set $addr
    local.get $addr
    local.get $addr
    i32.load
    i32.const 1
    i32.add
    i32.store
        ;; Inst: I
            ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
            ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
            ;; push
    local.get $sp
    local.get $b
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
            ;; push
    local.get $sp
    local.get $a
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: U
            ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
            ;; pop to $val
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $val
        local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    local.get $val
    i32.store
        ;; Inst: G
            ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: G
            ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: A
            ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
            ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
            ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: G
            ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: A
            ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
            ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
            ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: G
            ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: A
            ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
            ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
            ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: B
            ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
            ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
            ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.sub
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: H
            ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: H
            ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: V
            ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
            ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: L
        local.get $sp
    i32.const 4
    i32.sub
    local.set $addr
    local.get $addr
    local.get $addr
    i32.load
    i32.const 1
    i32.sub
    i32.store
        ;; Inst: I
            ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
            ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
            ;; push
    local.get $sp
    local.get $b
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
            ;; push
    local.get $sp
    local.get $a
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: U
            ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
            ;; pop to $val
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $val
        local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    local.get $val
    i32.store
        ;; Inst: H
            ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: V
            ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
            ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: Z
      local.get $sp
        i32.const 4
        i32.sub
        i32.load
        i32.const 0
        i32.ne
        br_if 0
      end
    end
      ;; Inst: J
      local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
      ;; Inst: K
      local.get $sp
    i32.const 4
    i32.sub
    local.set $addr
    local.get $addr
    local.get $addr
    i32.load
    i32.const 1
    i32.add
    i32.store
      ;; Inst: H
          ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: H
          ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: V
          ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
          ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: K
      local.get $sp
    i32.const 4
    i32.sub
    local.set $addr
    local.get $addr
    local.get $addr
    i32.load
    i32.const 1
    i32.add
    i32.store
      ;; Inst: I
          ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
          ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
          ;; push
    local.get $sp
    local.get $b
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
          ;; push
    local.get $sp
    local.get $a
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: U
          ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
          ;; pop to $val
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $val
      local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    local.get $val
    i32.store
      ;; Inst: K
      local.get $sp
    i32.const 4
    i32.sub
    local.set $addr
    local.get $addr
    local.get $addr
    i32.load
    i32.const 1
    i32.add
    i32.store
      ;; Inst: H
          ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: H
          ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: V
          ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
          ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: K
      local.get $sp
    i32.const 4
    i32.sub
    local.set $addr
    local.get $addr
    local.get $addr
    i32.load
    i32.const 1
    i32.add
    i32.store
      ;; Inst: I
          ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
          ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
          ;; push
    local.get $sp
    local.get $b
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
          ;; push
    local.get $sp
    local.get $a
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: U
          ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
          ;; pop to $val
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $val
      local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    local.get $val
    i32.store
      ;; Inst: K
      local.get $sp
    i32.const 4
    i32.sub
    local.set $addr
    local.get $addr
    local.get $addr
    i32.load
    i32.const 1
    i32.add
    i32.store
      ;; Inst: H
          ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: H
          ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: V
          ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
          ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: L
      local.get $sp
    i32.const 4
    i32.sub
    local.set $addr
    local.get $addr
    local.get $addr
    i32.load
    i32.const 1
    i32.sub
    i32.store
      ;; Inst: I
          ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
          ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
          ;; push
    local.get $sp
    local.get $b
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
          ;; push
    local.get $sp
    local.get $a
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: U
          ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
          ;; pop to $val
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $val
      local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    local.get $val
    i32.store
      ;; Inst: G
          ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: G
          ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: A
          ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
          ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
          ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: A
          ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
          ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
          ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: H
          ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: H
          ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: V
          ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
          ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: K
      local.get $sp
    i32.const 4
    i32.sub
    local.set $addr
    local.get $addr
    local.get $addr
    i32.load
    i32.const 1
    i32.add
    i32.store
      ;; Inst: I
          ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
          ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
          ;; push
    local.get $sp
    local.get $b
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
          ;; push
    local.get $sp
    local.get $a
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: U
          ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
          ;; pop to $val
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $val
      local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    local.get $val
    i32.store
      ;; Inst: H
          ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: V
          ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
          ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: Q
      block
      loop
        local.get $sp
        i32.const 4
        i32.sub
        i32.load
        i32.eqz
        br_if 1
        ;; Inst: J
        local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
        ;; Inst: L
        local.get $sp
    i32.const 4
    i32.sub
    local.set $addr
    local.get $addr
    local.get $addr
    i32.load
    i32.const 1
    i32.sub
    i32.store
        ;; Inst: H
            ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: V
            ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
            ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; Inst: Z
      local.get $sp
        i32.const 4
        i32.sub
        i32.load
        i32.const 0
        i32.ne
        br_if 0
      end
    end
      ;; Inst: J
      local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
      ;; Inst: L
      local.get $sp
    i32.const 4
    i32.sub
    local.set $addr
    local.get $addr
    local.get $addr
    i32.load
    i32.const 1
    i32.sub
    i32.store
      ;; Inst: H
          ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: H
          ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: V
          ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
          ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: L
      local.get $sp
    i32.const 4
    i32.sub
    local.set $addr
    local.get $addr
    local.get $addr
    i32.load
    i32.const 1
    i32.sub
    i32.store
      ;; Inst: I
          ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
          ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
          ;; push
    local.get $sp
    local.get $b
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
          ;; push
    local.get $sp
    local.get $a
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: U
          ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
          ;; pop to $val
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $val
      local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    local.get $val
    i32.store
      ;; Inst: H
          ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: V
          ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
          ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
      ;; Inst: Z
    local.get $sp
        i32.const 4
        i32.sub
        i32.load
        i32.const 0
        i32.ne
        br_if 0
      end
    end
    ;; Inst: J
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: V
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: M
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
    local.get $a
    call $print_char
    ;; Inst: K
    local.get $sp
    i32.const 4
    i32.sub
    local.set $addr
    local.get $addr
    local.get $addr
    i32.load
    i32.const 1
    i32.add
    i32.store
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: V
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: B
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.sub
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: I
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $b
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; push
    local.get $sp
    local.get $a
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: U
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; pop to $val
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $val
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    local.get $val
    i32.store
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: V
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: M
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
    local.get $a
    call $print_char
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: V
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: I
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $b
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; push
    local.get $sp
    local.get $a
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: U
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; pop to $val
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $val
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    local.get $val
    i32.store
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: V
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: M
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
    local.get $a
    call $print_char
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: V
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: M
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
    local.get $a
    call $print_char
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: V
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: I
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $b
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; push
    local.get $sp
    local.get $a
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: U
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; pop to $val
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $val
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    local.get $val
    i32.store
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: V
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: M
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
    local.get $a
    call $print_char
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: V
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: M
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
    local.get $a
    call $print_char
    ;; Inst: L
    local.get $sp
    i32.const 4
    i32.sub
    local.set $addr
    local.get $addr
    local.get $addr
    i32.load
    i32.const 1
    i32.sub
    i32.store
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: V
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: L
    local.get $sp
    i32.const 4
    i32.sub
    local.set $addr
    local.get $addr
    local.get $addr
    i32.load
    i32.const 1
    i32.sub
    i32.store
    ;; Inst: I
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $b
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; push
    local.get $sp
    local.get $a
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: U
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; pop to $val
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $val
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    local.get $val
    i32.store
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: V
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: M
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
    local.get $a
    call $print_char
    ;; Inst: L
    local.get $sp
    i32.const 4
    i32.sub
    local.set $addr
    local.get $addr
    local.get $addr
    i32.load
    i32.const 1
    i32.sub
    i32.store
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: V
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: M
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
    local.get $a
    call $print_char
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: V
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: I
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $b
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; push
    local.get $sp
    local.get $a
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: U
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; pop to $val
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $val
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    local.get $val
    i32.store
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: V
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: M
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
    local.get $a
    call $print_char
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: V
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: B
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.sub
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: I
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $b
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; push
    local.get $sp
    local.get $a
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: U
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; pop to $val
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $val
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    local.get $val
    i32.store
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: V
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: M
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
    local.get $a
    call $print_char
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: V
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: B
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.sub
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: I
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $b
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; push
    local.get $sp
    local.get $a
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: U
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; pop to $val
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $val
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    local.get $val
    i32.store
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: V
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: M
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
    local.get $a
    call $print_char
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: V
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: K
    local.get $sp
    i32.const 4
    i32.sub
    local.set $addr
    local.get $addr
    local.get $addr
    i32.load
    i32.const 1
    i32.add
    i32.store
    ;; Inst: I
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $b
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; push
    local.get $sp
    local.get $a
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: U
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; pop to $val
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $val
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    local.get $val
    i32.store
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: V
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: M
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
    local.get $a
    call $print_char
    ;; Inst: K
    local.get $sp
    i32.const 4
    i32.sub
    local.set $addr
    local.get $addr
    local.get $addr
    i32.load
    i32.const 1
    i32.add
    i32.store
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: V
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: G
        ;; push
    local.get $sp
    i32.const 1
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: A
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $a
    local.get $b
    i32.add
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: I
        ;; pop to $b
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $b
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
        ;; push
    local.get $sp
    local.get $b
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
        ;; push
    local.get $sp
    local.get $a
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: U
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; pop to $val
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $val
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    local.get $val
    i32.store
    ;; Inst: H
        ;; push
    local.get $sp
    local.get $sp
    i32.const 4
    i32.sub
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: V
        ;; pop to $addr
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $addr
        ;; push
    local.get $sp
    local.get $addr
    i32.const 4
    i32.mul
    i32.const 1000000
    i32.add
    i32.load
    i32.store
    local.get $sp
    i32.const 4
    i32.add
    local.set $sp
    ;; Inst: M
        ;; pop to $a
    local.get $sp
    i32.const 4
    i32.sub
    local.set $sp
    local.get $sp
    i32.load
    local.set $a
    local.get $a
    call $print_char
  )
)

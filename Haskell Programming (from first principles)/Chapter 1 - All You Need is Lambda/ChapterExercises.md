# Chapter Exercises

## Combinators

1. λx.xxx is a combinator
2. λxy.zx is not a combinator (free variable z)
3. λxyz.xy(zx) is a combinator
4. λxyz.xy(zxy) is a combinator
5. λxy.xy(zxy) is not a combinator (free variable z)

## Normal form or diverge

### 1. λx.xxx

Already in normal form

### 2. (λz.zz)(λy.yy)

[z := (λy.yy)]
(λy.yy)(λy.yy) (= omega)
[y := (λy.yy)]
(λy.yy)(λy.yy)

As stated above this is the omega function which never terminates.

### 3. (λx.xxx)z

[x := z]
zzz (NF)

## Beta reduce

### 1. (λabc.cba)zz(λwv.w)

(λa.λb.λc.cba)zz(λwv.w) -- Curry
(λb.λc.cbz)z(λwv.w)     -- Apply z
(λc.czz)(λwv.w)         -- Apply z
(λwv.w)zz
z

### 2. (λx.λy.xyy)(λa.a)b

((λy.(λa.a)yy)b
(λa.a)bb
bb

### 3. (λy.y)(λx.xx)(λz.zq)

(λx.xx)(λz.zq)
(λz.zq)(λz.zq)
(λz.zq)q
qq

### 4. (λz.z)(λz.zz)(λz.zy)

Let's first rename this for clarity.

(λz.z)(λm.mm)(λn.ny)
(λm.mm)(λn.ny)
(λn.ny)(λn.ny)
(λn.ny)y
yy

### 5. (λx.λy.xyy)(λy.y)y

Rename again

(λx.λy.xyy)(λm.m)n
(λy.(λm.m)yy)n
(λm.m)nn
nn

### 6. (λa.aa)(λb.ba)c

Rename

(λa.aa)(λb.bm)c
(λb.bm)(λb.bm)c
(λb.bm)mc
mmc

### 7. (λxyz.xz(yz))(λx.z)(λx.a)

Rename

(λx.λy.λz.xz(yz))(λm.n)(λo.p)
(λy.λz.(λm.n)z(yz))(λo.p)
(λz.(λm.n)z((λo.p)z))
(λz.(λm.n)z(p))
(λz.(λm.n)zp)
(λz.zp)

! Copyright Dieter Britz 1990
! See also D. Britz, "Digital Simulation in Electrochemistry", 2nd ed., Springer-Verlag, 1988, ISBN 0-387-18979-3
! Modifications by Otavio Luiz Bottecchia, 2026


      REAL FUNCTION G0FUNC (C, N, H)
! COMPUTES G0 AS THE N-POINT APPROXIMATION FROM THE CONCENTRATION PROFILE C,
! USING THE POINT H-SEQUENCE H, 2H, 3H... FOR N = 2..7. ZERO IS RETURNED
! IF N LIES OUTSIDE THE RANGE 2..7.

      REAL, dimension(0:*)        :: C
      INTEGER, DIMENSION(2:7)     :: A
      INTEGER, DIMENSION(2:7,0:6) :: B
      INTEGER                     :: I, N
      REAL                        :: SUM, H

      DATA B / -1, -3, -11, -25, -137, -147, &
                1,  4,  18,  48,  300,  360, &
                0, -1,  -9, -36, -300, -450, &
                0,  0,   2,  16,  200,  400, &
                0,  0,   0,  -3,  -75, -225, &
                0,  0,   0,   0,   12,   72, &
                0,  0,   0,   0,    0,  -10  /
      DATA A /  1,  2,   6,  12,   60,   60  /

      IF (N.GE.2 .AND. N.LE.7) THEN
          SUM = 0.0E00
          DO 10  I = 0, N-1
              SUM = SUM + B(N,I)*C(I)
10        CONTINUE
          G0FUNC = SUM / A(N) / H

      ELSE
          G0FUNC = 0.
      ENDIF
      END


      REAL FUNCTION C0FUNC (C, N, H, G0)
! COMPUTES C0 FROM THE N-POINT G0 FUNCTION AND THE CONCENTRATION PROFILE C,
! USING THE POINT H-SEQUENCE H, 2H, 3H... FOR N = 2..7, GIVEN G0 AND H.
! A RESULT (C0) OF -1 IS RETURNED IF N FALLS OUTSIDE THE RANGE 2..7.

      REAL, dimension(0:*)        :: C
      INTEGER, DIMENSION(2:7)     :: A
      INTEGER, DIMENSION(2:7,0:6) :: B
      INTEGER                     :: I, N
      REAL                        :: SUM, H, G0

      DATA B / -1, -3, -11, -25, -137, -147, &
                1,  4,  18,  48,  300,  360, &
                0, -1,  -9, -36, -300, -450, &
                0,  0,   2,  16,  200,  400, &
                0,  0,   0,  -3,  -75, -225, &
                0,  0,   0,   0,   12,   72, &
                0,  0,   0,   0,    0,  -10  /
      DATA A /  1,  2,   6,  12,   60,   60  /

      IF (N.GE.2 .AND. N.LE.7) THEN
          SUM = 0.0E00
          DO 10  I = 1, N-1
              SUM = SUM + B(N,I)*C(I)
10        CONTINUE
          C0FUNC = - (SUM -A(N)*H*G0) / B(N,0)

      ELSE
          C0FUNC = -1.
      ENDIF

      END

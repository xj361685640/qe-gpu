
! Copyright (C) 2001 PWSCF group
! This file is distributed under the terms of the
! GNU General Public License. See the file `License'
! in the root directory of the present distribution,
! or http://www.gnu.org/copyleft/gpl.txt .
!
!
!-----------------------------------------------------------------------
subroutine allocate_locpot
  !-----------------------------------------------------------------------
  !
  ! dynamical allocation of arrays:
  ! local potential for each kind of atom, structure factor
  !
  USE ions_base, ONLY : nat, ntyp => nsp
  USE vlocal,    ONLY : vloc, strf
  USE gvect,     ONLY : eigts1, eigts2, eigts3, ngm, ngl
  USE fft_base , ONLY : dfftp
  !
#ifdef USE_CUDA
  USE vlocal,    ONLY : strf_d
  USE gvect,     ONLY : eigts1_d, eigts2_d, eigts3_d
#endif
  !
  implicit none
  !
  allocate (vloc( ngl, ntyp))    
  allocate (strf( ngm, ntyp))    

  allocate( eigts1(-dfftp%nr1:dfftp%nr1,nat) )
  allocate( eigts2(-dfftp%nr2:dfftp%nr2,nat) )
  allocate( eigts3(-dfftp%nr3:dfftp%nr3,nat) )

#ifdef USE_CUDA
  allocate (strf_d( ngm, ntyp))    
  allocate( eigts1_d(-dfftp%nr1:dfftp%nr1,nat) )
  allocate( eigts2_d(-dfftp%nr2:dfftp%nr2,nat) )
  allocate( eigts3_d(-dfftp%nr3:dfftp%nr3,nat) )
#endif

  return
end subroutine allocate_locpot


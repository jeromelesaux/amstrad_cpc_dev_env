;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.2 #9293 (MINGW64)
; This file was generated Tue Sep 15 21:43:33 2015
;--------------------------------------------------------
	.module code
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _Dummy
	.globl _cpc_Uncrunch
	.globl _cpc_SetModo
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;data_pu.h:4: void Dummy()
;	---------------------------------
; Function Dummy
; ---------------------------------
_Dummy::
;data_pu.h:110: __endasm;
	_image:
	.DB #0x21, #0x3C, #0x70, #0x75, #0x33, #0x41, #0x00, #0x58, #0x02, #0x00, #0x08, #0x80, #0x02, #0xFF, #0xFF, #0x02
	.DB #0xF0, #0x00, #0x40, #0x09, #0xC1, #0x70, #0x3F, #0xC6, #0xC6, #0x79, #0x87, #0x3A, #0x70, #0x74, #0xB8, #0x3C
	.DB #0x23, #0xAB, #0xE3, #0x08, #0x04, #0x60, #0xCE, #0xE3, #0xC1, #0x60, #0x23, #0x06, #0x7C, #0xF1, #0x61, #0x47
	.DB #0x02, #0x70, #0x62, #0x80, #0xA3, #0x03, #0xB8, #0xE7, #0x3B, #0x68, #0xEC, #0x42, #0x0E, #0x16, #0x07, #0xCC
	.DB #0x16, #0x08, #0x41, #0xEC, #0x55, #0x64, #0x60, #0xE4, #0xFC, #0x64, #0x5C, #0x6C, #0x72, #0xFC, #0xD0, #0xC0
	.DB #0xF2, #0x30, #0x76, #0x29, #0x4C, #0x17, #0x47, #0x0E, #0xC2, #0xEF, #0xCB, #0x16, #0x1C, #0x05, #0xB1, #0x98
	.DB #0x7D, #0x9E, #0x39, #0x2E, #0xA8, #0x03, #0x23, #0xD9, #0x18, #0x3A, #0x3E, #0x9E, #0x4B, #0x83, #0xE3, #0x06
	.DB #0x03, #0x13, #0x62, #0xC1, #0x00, #0x3D, #0x96, #0x06, #0x82, #0x5A, #0xC0, #0xD8, #0xB4, #0xF8, #0xEB, #0x47
	.DB #0x40, #0x43, #0x62, #0xC3, #0x23, #0x05, #0x60, #0x7D, #0x95, #0x03, #0x05, #0x86, #0x8B, #0xF3, #0x3E, #0x9A
	.DB #0xA9, #0xF7, #0xA6, #0x07, #0xFD, #0x96, #0x44, #0xE1, #0xEE, #0x2D, #0x4F, #0x4F, #0x78, #0xDC, #0xCB, #0x64
	.DB #0xD9, #0x3A, #0xCA, #0x5D, #0x50, #0x1D, #0xC6, #0xB7, #0x16, #0x9B, #0xB1, #0x95, #0xB5, #0xCE, #0xE3, #0x4D
	.DB #0xFE, #0xBC, #0x6D, #0xB8, #0x1A, #0x3C, #0x68, #0x60, #0xA2, #0xC5, #0x58, #0x31, #0x40, #0x7A, #0xD5, #0x62
	.DB #0x10, #0x75, #0xB4, #0x4F, #0xB6, #0xFF, #0x81, #0xC2, #0xE3, #0x40, #0x62, #0xA0, #0x74, #0x60, #0xCD, #0xC1
	.DB #0xFB, #0xC4, #0xA4, #0x51, #0x86, #0xDF, #0x76, #0xC4, #0x02, #0x90, #0xCC, #0x10, #0x0F, #0xBA, #0x30, #0xD6
	.DB #0x03, #0x8C, #0x0F, #0x8E, #0x27, #0x9C, #0xB0, #0x7D, #0x9E, #0x38, #0xBA, #0xE0, #0x67, #0x27, #0x07, #0xA2
	.DB #0xE0, #0xD0, #0xB0, #0xD0, #0xEF, #0xD8, #0xF8, #0xCB, #0x1E, #0xFD, #0x49, #0x08, #0xF9, #0x02, #0x51, #0x08
	.DB #0x3F, #0x8E, #0xF9, #0x62, #0xE9, #0x40, #0x7D, #0xE4, #0x9B, #0xF7, #0xA0, #0x8B, #0xDC, #0x33, #0xFD, #0x43
	.DB #0x10, #0x8E, #0x96, #0x82, #0xD7, #0x59, #0xA8, #0x71, #0x5E, #0xA2, #0x15, #0xA2, #0xB5, #0xD2, #0x32, #0x48
	.DB #0x59, #0xA8, #0xE1, #0x5E, #0x2A, #0xFC, #0x0F, #0x75, #0xEA, #0xB9, #0x56, #0x6A, #0x32, #0x57, #0x8B, #0x85
	.DB #0x78, #0xA2, #0x34, #0x78, #0xBF, #0x90, #0x82, #0x20, #0x5E, #0x2B, #0x0D, #0x0C, #0x2B, #0xBF, #0x8C, #0x63
	.DB #0x50, #0x83, #0x3C, #0x63, #0xAF, #0xDC, #0x76, #0xAD, #0x2C, #0x3D, #0x47, #0x7F, #0xF1, #0x13, #0x00, #0x4E
	.DB #0x1F, #0x8E, #0x98, #0x06, #0x5B, #0x3E, #0x98, #0xE2, #0xE0, #0xFA, #0xB3, #0x00, #0x58, #0x1C, #0x18, #0xC1
	.DB #0xFF, #0xCA, #0x67, #0xEB, #0x43, #0xE7, #0x4C, #0x01, #0xF0, #0x50, #0xB5, #0xB1, #0x4D, #0xC0, #0x51, #0x2E
	.DB #0x0F, #0xBB, #0x30, #0x05, #0x81, #0xE1, #0x98, #0x03, #0x3F, #0x15, #0x30, #0x0C, #0x8E, #0xD5, #0xC1, #0xF2
	.DB #0xE6, #0x01, #0xC4, #0x30, #0x7E, #0x0E, #0x58, #0xCB, #0x83, #0x74, #0x1B, #0x5C, #0x1F, #0xFF, #0xCC, #0x03
	.DB #0xFD, #0x89, #0x80, #0x21, #0x0F, #0x1C, #0x48, #0xEB, #0xDC, #0x58, #0x1D, #0x86, #0xE6, #0x24, #0x52, #0xB0
	.DB #0x36, #0x4E, #0xBC, #0xF1, #0x5F, #0xAB, #0x3F, #0x63, #0x2B, #0xBC, #0xC0, #0x11, #0x87, #0x16, #0xEE, #0x6E
	.DB #0x17, #0x1E, #0x19, #0x80, #0x7B, #0x15, #0x65, #0x18, #0x5A, #0x9D, #0x3E, #0xEE, #0x8D, #0xA8, #0x25, #0x31
	.DB #0x70, #0x79, #0x66, #0x01, #0x5F, #0xCF, #0xBE, #0x60, #0x0C, #0x58, #0x1C, #0x66, #0x00, #0xEB, #0x2F, #0x08
	.DB #0xC0, #0xE9, #0x30, #0x05, #0x61, #0xF0, #0xA6, #0x01, #0xB1, #0x5E, #0xB8, #0x3A, #0x5E, #0x03, #0x85, #0x05
	.DB #0xBF, #0x5C, #0x42, #0x7E, #0x40, #0x8E, #0x4E, #0x0F, #0xE4, #0x3E, #0x50, #0xB9, #0xFB, #0xF3, #0x4E, #0xFC
	.DB #0x4C, #0xC0, #0x72, #0x2C, #0x96, #0x07, #0xE8, #0xCC, #0x6F, #0xAA, #0x31, #0x3A, #0x48, #0xFD, #0xC7, #0x5F
	.DB #0xC7, #0x0D, #0x3D, #0xC6, #0xBB, #0x3E, #0xBC, #0xC0, #0x05, #0xC5, #0x81, #0xE4, #0x98, #0x02, #0x80, #0xFA
	.DB #0xD3, #0x00, #0x46, #0x1E, #0x69, #0x80, #0x27, #0x0E, #0x2C, #0x71, #0x40, #0x7D, #0x49, #0x80, #0x6F, #0x04
	.DB #0xDD, #0x1F, #0x1C, #0xA6, #0x7E, #0xA0, #0x3E, #0x6C, #0xC0, #0x33, #0x8F, #0xF7, #0x26, #0x0A, #0x8B, #0x25
	.DB #0x21, #0x45, #0x77, #0x19, #0x80, #0x2C, #0x0F, #0x9F, #0x30, #0x04, #0xE1, #0xD2, #0x60, #0x0A, #0x03, #0xF1
	.DB #0x93, #0x00, #0x4E, #0x1D, #0xA8, #0xAC, #0xB0, #0x3E, #0x7A, #0x44, #0xB3, #0x50, #0xF9, #0x93, #0x00, #0x35
	.DB #0x7E, #0x10, #0xB0, #0xF9, #0x2F, #0x15, #0x08, #0x7B, #0x80, #0x85, #0x42, #0x0F, #0xFB, #0x8C, #0x9F, #0x4A
	.DB #0x60, #0x08, #0x42, #0x90, #0x7D, #0xCE, #0xB3, #0x68, #0x98, #0xF0, #0xDB, #0x2C, #0xB7, #0xCA, #0xFA, #0x33
	.DB #0x00, #0x3A, #0x53, #0x87, #0x92, #0x60, #0x1A, #0x9A, #0x85, #0x99, #0x27, #0xCA, #0x98, #0x06, #0xAE, #0x8D
	.DB #0xD6, #0x60, #0x0A, #0x03, #0x94, #0xC0, #0x1E, #0x8A, #0x03, #0xE0, #0xCC, #0x01, #0x70, #0x78, #0x66, #0x00
	.DB #0xB0, #0x10, #0x83, #0x0B, #0xCE, #0x53, #0x00, #0x52, #0x0F, #0x8B, #0xC2, #0x2B, #0xDD, #0x6B, #0x07, #0xAA
	.DB #0x90, #0xDD, #0xD2, #0x39, #0xE2, #0x86, #0x3E, #0x19, #0xFA, #0xFB, #0x02, #0xBA, #0xFC, #0x66, #0x30, #0x36
	.DB #0x28, #0x0F, #0x90, #0x2E, #0x3E, #0xF0, #0x44, #0x46, #0x0F, #0x2F, #0xC4, #0xCD, #0xAB, #0xEB, #0x42, #0x21
	.DB #0x00, #0xA0, #0x6F, #0xC4, #0x4C, #0x02, #0xE3, #0x9E, #0xFB, #0x38, #0x7C, #0x2B, #0x73, #0xFC, #0x34, #0xC0
	.DB #0x11, #0x81, #0xB9, #0xFA, #0x49, #0x80, #0x72, #0xCF, #0xDA, #0xB8, #0x3E, #0xC4, #0xC0, #0x36, #0x06, #0xB9
	.DB #0x67, #0xB8, #0x25, #0x3E, #0x84, #0xD4, #0x0D, #0x0A, #0x33, #0x34, #0xFB, #0x7A, #0xCC, #0x02, #0xB0, #0xAF
	.DB #0xA1, #0x4B, #0x0E, #0xB8, #0xC0, #0x19, #0xB9, #0x80, #0x21, #0x0F, #0xC3, #0x4C, #0x03, #0xD5, #0x1A, #0x2F
	.DB #0xC6, #0xCC, #0x01, #0x08, #0x7C, #0x4C, #0xB8, #0x1F, #0x2B, #0x25, #0xB7, #0xB8, #0x26, #0x92, #0x0A, #0x01
	.DB #0xFF, #0x22, #0x91, #0x08, #0x7E, #0x3A, #0xBB, #0x5E, #0xE4, #0xF4, #0x8C, #0x1E, #0x9D, #0x87, #0x62, #0x30
	.DB #0xDA, #0x78, #0x50, #0x1C, #0x66, #0x80, #0xEB, #0xDF, #0x30, #0x0B, #0x3A, #0x0E, #0x62, #0x99, #0x60, #0x72
	.DB #0x1E, #0xDC, #0xAC, #0x43, #0x98, #0x72, #0x56, #0xC3, #0xCF, #0x1A, #0x87, #0xBE, #0x60, #0x06, #0xE7, #0x00
	.DB #0xE0, #0xB0, #0x3C, #0x73, #0x00, #0x58, #0x1E, #0x19, #0x80, #0x2C, #0x0F, #0x45, #0x18, #0x3D, #0x73, #0x00
	.DB #0x74, #0xA0, #0x39, #0xE4, #0x4A, #0x50, #0x0E, #0x8D, #0xC7, #0x5E, #0x9C, #0x4A, #0x7A, #0x8D, #0x25, #0x66
	.DB #0xAB, #0x83, #0xA3, #0x9D, #0x75, #0xFA, #0xDB, #0x02, #0xBC, #0x3F, #0x19, #0x8C, #0x0C, #0x29, #0xF8, #0xE2
	.DB #0xDF, #0xF0, #0x00, #0x58, #0xB4, #0xFC, #0x59, #0xCF, #0xDE, #0xE6, #0xEF, #0xDE, #0x63, #0x00, #0xDD, #0xBF
	.DB #0xFE, #0xFE, #0xB5, #0x0F, #0xB9, #0x30, #0x0B, #0x18, #0x04, #0xE0, #0xCF, #0x24, #0xC0, #0x10, #0x07, #0xE3
	.DB #0x66, #0x01, #0xD3, #0x87, #0x1D, #0xF5, #0xE6, #0x00, #0x84, #0x39, #0x6F, #0xC8, #0x3C, #0x34, #0x6E, #0xFE
	.DB #0x8E, #0xB5, #0x0D, #0x53, #0x30, #0xC7, #0xDE, #0x07, #0xCE, #0x33, #0x00, #0xEA, #0x52, #0xFE, #0x6C, #0xD4
	.DB #0x0F, #0xBD, #0x85, #0xCD, #0xB9, #0x2F, #0xBD, #0x30, #0x0E, #0x5C, #0x4C, #0x6F, #0xD2, #0xCC, #0x03, #0xE1
	.DB #0xEB, #0x50, #0x3F, #0x1F, #0xF6, #0xF9, #0x31, #0x2B, #0xAF, #0x7C, #0xD3, #0x97, #0x07, #0xE2, #0x26, #0x00
	.DB #0x9C, #0x3C, #0xB3, #0x00, #0xDC, #0x36, #0x37, #0x88, #0x9F, #0x5B, #0xCB, #0x77, #0x30, #0x04, #0x61, #0xF1
	.DB #0xE6, #0x01, #0x44, #0x26, #0xA7, #0x7B, #0xC3, #0x86, #0x7E, #0x9C, #0x37, #0x61, #0x15, #0x81, #0xF6, #0x66
	.DB #0x00, #0x7C, #0xEE, #0x60, #0x1B, #0x99, #0x6A, #0x30, #0xF2, #0x4C, #0x01, #0x70, #0x7A, #0x25, #0xE4, #0x84
	.DB #0x3E, #0x34, #0xC0, #0x0F, #0x1D, #0x84, #0xBF, #0x2E, #0xBA, #0xAF, #0x6C, #0x82, #0xF6, #0x70, #0x3F, #0x20
	.DB #0xEE, #0x5F, #0xC2, #0x7E, #0x2F, #0x18, #0x1D, #0x3B, #0xFF, #0x14, #0x5B, #0x7E, #0x0F, #0x32, #0x7B, #0xAF
	.DB #0xC5, #0x4D, #0xA9, #0x70, #0x7E, #0xFE, #0x60, #0x08, #0x41, #0xD7, #0xE2, #0x66, #0x01, #0x41, #0x6F, #0xD2
	.DB #0x98, #0x01, #0x72, #0xB0, #0x3D, #0x33, #0x00, #0x4E, #0x1F, #0x56, #0x60, #0x08, #0x43, #0xD3, #0x30, #0x0E
	.DB #0x1C, #0x38, #0xE5, #0x01, #0xF5, #0xA6, #0x01, #0xC2, #0x13, #0x6E, #0xB2, #0x39, #0x56, #0x07, #0xD2, #0x98
	.DB #0x06, #0x99, #0x06, #0x46, #0x0D, #0x15, #0x9E, #0x1E, #0x18, #0x05, #0xBA, #0x87, #0xD5, #0x98, #0x05, #0x16
	.DB #0x1A, #0x49, #0xC7, #0xA7, #0xDD, #0x98, #0x07, #0x4C, #0x16, #0xCE, #0x14, #0x07, #0xF0, #0x73, #0x00, #0x7F
	.DB #0xDC, #0x64, #0x4E, #0x0C, #0xF8, #0x51, #0xE0, #0xF7, #0x8B, #0xBE, #0xEF, #0x6A, #0x8E, #0xEF, #0x7C, #0xC0
	.DB #0x10, #0x83, #0x39, #0xE3, #0xE5, #0xDE, #0xF8, #0x0D, #0xCC, #0x02, #0x8F, #0xAD, #0xC2, #0xF9, #0x38, #0x7A
	.DB #0xA6, #0x00, #0x43, #0xF5, #0x17, #0x5A, #0x1E, #0xD8, #0x44, #0x0A, #0xC3, #0xA4, #0xC0, #0x14, #0x02, #0x30
	.DB #0xF9, #0xB3, #0x00, #0xB4, #0xD0, #0xF2, #0x4C, #0x03, #0x6C, #0xC7, #0x42, #0xC2, #0x85, #0x47, #0xB2, #0xC0
	.DB #0xF3, #0xEA, #0xF2, #0xF8, #0x13, #0x00, #0xDE, #0xB4, #0x9F, #0x76, #0x03, #0xDD, #0x9F, #0x5F, #0xD8, #0xEB
	.DB #0x20, #0xFB, #0xF3, #0x00, #0x4E, #0x1F, #0x7E, #0x60, #0x3D, #0xC5, #0xAF, #0xE1, #0x4F, #0xC3, #0x3F, #0x1A
	.DB #0x6B, #0xD8, #0xB0, #0x3F, #0x7F, #0x30, #0x0D, #0xC4, #0xC3, #0xF1, #0x53, #0x00, #0xFA, #0xD3, #0x50, #0xF3
	.DB #0x4C, #0x00, #0xE7, #0xDF, #0x3E, #0xED, #0x60, #0x7E, #0x22, #0x60, #0x07, #0xC2, #0x70, #0xFB, #0xB3, #0x00
	.DB #0xE9, #0xCB, #0xF9, #0xCC, #0xD1, #0x54, #0x07, #0xDC, #0xE5, #0xA8, #0x6F, #0x9E, #0xF9, #0xC6, #0x73, #0x7D
	.DB #0x3A, #0x15, #0x3F, #0x42, #0x60, #0x1A, #0x03, #0xA7, #0xDE, #0xE1, #0x9E, #0xF6, #0xD8, #0x9F, #0x58, #0x1F
	.DB #0x2E, #0x60, #0x1B, #0xAE, #0x4F, #0xBE, #0x6C, #0x9F, #0xFF, #0xCC, #0x03, #0xFF, #0xE9, #0x80, #0x7C, #0x3D
	.DB #0xDC, #0x7B, #0xC6, #0x8F, #0xB2, #0x75, #0x91, #0x95, #0xE4, #0x26, #0x5A, #0xCF, #0xD5, #0xBC, #0x77, #0xDD
	.DB #0x26, #0x8D, #0xD3, #0x7C, #0x02, #0xC0, #0xD3, #0x69, #0xF9, #0x13, #0x00, #0x4E, #0x1D, #0x3A, #0x6A, #0x19
	.DB #0x64, #0xBB, #0xC6, #0xC7, #0xB6, #0x25, #0xF0, #0xE6, #0x00, #0xA0, #0x38, #0x8F, #0x6F, #0x74, #0xC0, #0x31
	.DB #0x4A, #0x14, #0x60, #0xE8, #0xD7, #0x7B, #0x2E, #0x0F, #0x47, #0x50, #0x47, #0xBC, #0xC0, #0x10, #0x07, #0x69
	.DB #0x80, #0x1E, #0x0C, #0xDE, #0xC5, #0x7F, #0x57, #0x18, #0xF7, #0x7C, #0xC2, #0xAF, #0xE4, #0x26, #0x03, #0xF0
	.DB #0xAD, #0xB9, #0xF8, #0x7E, #0x9A, #0x72, #0x10, #0xEF, #0x8C, #0x0F, #0xF0, #0x22, #0xD3, #0xF1, #0x6E, #0xBD
	.DB #0x00, #0x7E, #0xFE, #0x60, #0x1A, #0xBE, #0x2F, #0xEF, #0xFB, #0x6A, #0x1E, #0xA9, #0x80, #0x21, #0x0E, #0x0F
	.DB #0xB3, #0xEA, #0xCC, #0x03, #0x23, #0x27, #0x54, #0xC1, #0xDB, #0x87, #0x67, #0xDC, #0x98, #0x03, #0xD3, #0x23
	.DB #0xDD, #0x40, #0x7E, #0x0E, #0x60, #0x1D, #0x38, #0x6A, #0x19, #0x8E, #0xDE, #0xF8, #0xE8, #0x1F, #0x52, #0x60
	.DB #0x1C, #0x63, #0xDB, #0xBC, #0x3C, #0xBD, #0x7B, #0x88, #0x2A, #0x03, #0xE6, #0x4C, #0x01, #0x38, #0x7D, #0xE4
	.DB #0x0F, #0xA2, #0x72, #0xA0, #0x3F, #0xFF, #0x98, #0x07, #0xFB, #0xB3, #0x00, #0x4E, #0x0E, #0xBD, #0xE9, #0x5B
	.DB #0x90, #0xDE, #0xDC, #0xC9, #0x3C, #0xCA, #0x97, #0x4F, #0xEC, #0xFC, #0xDC, #0x85, #0xFB, #0xCC, #0x03, #0x28
	.DB #0x59, #0x68, #0x6F, #0x97, #0xFB, #0xCE, #0x60, #0x0A, #0x03, #0xD9, #0x30, #0x0E, #0xBD, #0xB5, #0x02, #0x7F
	.DB #0xBC, #0xC0, #0x19, #0xF4, #0x26, #0x00, #0xE1, #0x00, #0x79, #0xE6, #0x00, #0x84, #0x3E, #0x2F, #0x6D, #0x43
	.DB #0x6D, #0x83, #0xD3, #0x30, #0x0E, #0x01, #0x1C, #0x6B, #0xF8, #0x8E, #0xE1, #0x38, #0x3A, #0xFC, #0x1C, #0xCB
	.DB #0x3E, #0x8C, #0xE4, #0x7E, #0xDC, #0xC0, #0x13, #0x87, #0xF2, #0xDD, #0xB4, #0xF4, #0x20, #0xEB, #0xF8, #0x4E
	.DB #0x86, #0xB5, #0xFF, #0xFC
	ret
;code.c:13: main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;code.c:16: cpc_SetModo(1);
	ld	l,#0x01
	call	_cpc_SetModo
;code.c:17: cpc_Uncrunch(image,#0xc000);
	ld	hl,#_image
	ld	bc,#0xC000
	push	bc
	push	hl
	call	_cpc_Uncrunch
;code.c:19: while(1); 
00102$:
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)

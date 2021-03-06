#ifndef _WBFS_H_
#define _WBFS_H_

#include "libwbfs/libwbfs.h"
#include "utils.h"

#ifdef __cplusplus
extern "C" {
#endif

/* Macros */
#define WBFS_MIN_DEVICE		1
#define WBFS_MAX_DEVICE		2

//also menu.hpp
#define PART_FS_WBFS 0
#define PART_FS_FAT  1
#define PART_FS_NTFS 2
#define PART_FS_EXT  3

extern s32 wbfsDev;
extern int wbfs_part_fs;
extern u32 wbfs_part_lba;
extern char wbfs_fs_drive[16];

/* Prototypes */
s32 WBFS_Format(u32, u32);
s32 WBFS_Init(wbfs_t *handle, u32 part_fs, u32 part_lba, char *partition, u8 current);
s32 WBFS_CheckGame(char *discid, char *path);
s32 WBFS_AddGame(progress_callback_t spinner, void *spinner_data);
s32 WBFS_RemoveGame(char *discid, char *gamepath);
s32 WBFS_GameSize(char *discid, char *, f32 *);
s32 WBFS_DVD_Size(u64 *comp_size, u64 *real_size);
s32 WBFS_DiskSpace(f32 *, f32 *);

wbfs_disc_t* WBFS_OpenDisc(char *discid, char *path);
void WBFS_CloseDisc(wbfs_disc_t *disc);
bool WBFS_Close();
bool WBFS_Mounted();

s32 __WBFS_ReadSDHC(void *fp, u32 lba, u32 count, void *iobuf);
s32 __WBFS_WriteSDHC(void *fp, u32 lba, u32 count, void *iobuf);
s32 __WBFS_ReadUSB(void *fp, u32 lba, u32 count, void *iobuf);
s32 __WBFS_WriteUSB(void *fp, u32 lba, u32 count, void *iobuf);
s32 __WBFS_ReadDVD(void *fp, u32 lba, u32 count, void *iobuf);

#ifdef __cplusplus
}
#endif

#endif

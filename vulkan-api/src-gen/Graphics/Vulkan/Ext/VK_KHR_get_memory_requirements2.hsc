#include "vulkan/vulkan.h"

{-# LANGUAGE DataKinds                #-}
{-# LANGUAGE FlexibleContexts         #-}
{-# LANGUAGE FlexibleInstances        #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE MagicHash                #-}
{-# LANGUAGE PatternSynonyms          #-}
{-# LANGUAGE Strict                   #-}
{-# LANGUAGE TypeFamilies             #-}
{-# LANGUAGE TypeOperators            #-}
{-# LANGUAGE UnboxedTuples            #-}
{-# LANGUAGE UndecidableInstances     #-}
{-# LANGUAGE UnliftedFFITypes         #-}
{-# LANGUAGE ViewPatterns             #-}
module Graphics.Vulkan.Ext.VK_KHR_get_memory_requirements2
       (-- * Vulkan extension: @VK_KHR_get_memory_requirements2@
        -- |
        --
        -- supported: @vulkan@
        --
        -- contact: @Jason Ekstrand @jekstrand@
        --
        -- author: @KHR@
        --
        -- type: @device@
        --
        -- Extension number: @147@
        VkBufferMemoryRequirementsInfo2KHR(..),
        VkImageMemoryRequirementsInfo2KHR(..),
        VkImageSparseMemoryRequirementsInfo2KHR(..),
        VkMemoryRequirements2KHR(..),
        VkSparseImageMemoryRequirements2KHR(..),
        vkGetImageMemoryRequirements2KHR,
        vkGetBufferMemoryRequirements2KHR,
        vkGetImageSparseMemoryRequirements2KHR,
        VK_KHR_GET_MEMORY_REQUIREMENTS_2_SPEC_VERSION,
        pattern VK_KHR_GET_MEMORY_REQUIREMENTS_2_SPEC_VERSION,
        VK_KHR_GET_MEMORY_REQUIREMENTS_2_EXTENSION_NAME,
        pattern VK_KHR_GET_MEMORY_REQUIREMENTS_2_EXTENSION_NAME,
        pattern VK_STRUCTURE_TYPE_BUFFER_MEMORY_REQUIREMENTS_INFO_2_KHR,
        pattern VK_STRUCTURE_TYPE_IMAGE_MEMORY_REQUIREMENTS_INFO_2_KHR,
        pattern VK_STRUCTURE_TYPE_IMAGE_SPARSE_MEMORY_REQUIREMENTS_INFO_2_KHR,
        pattern VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2_KHR,
        pattern VK_STRUCTURE_TYPE_SPARSE_IMAGE_MEMORY_REQUIREMENTS_2_KHR)
       where
import           Data.Int
import           Data.Void                        (Void)
import           Data.Word
import           Foreign.C.String                 (CString)
import           Foreign.C.Types                  (CChar (..), CFloat (..),
                                                   CInt (..), CSize (..),
                                                   CULong (..))
import           Foreign.Storable                 (Storable (..))
import           GHC.ForeignPtr                   (ForeignPtr (..),
                                                   ForeignPtrContents (..),
                                                   newForeignPtr_)
import           GHC.Prim
import           GHC.Ptr                          (Ptr (..))
import           GHC.Types                        (IO (..), Int (..))
import           Graphics.Vulkan.Base
import           Graphics.Vulkan.Common
import           Graphics.Vulkan.Core
import           Graphics.Vulkan.Marshal
import           Graphics.Vulkan.Marshal.Internal
import           Graphics.Vulkan.StructMembers
import           System.IO.Unsafe                 (unsafeDupablePerformIO)

data VkBufferMemoryRequirementsInfo2KHR = VkBufferMemoryRequirementsInfo2KHR## ByteArray##

instance Eq VkBufferMemoryRequirementsInfo2KHR where
        (VkBufferMemoryRequirementsInfo2KHR## a) ==
          (VkBufferMemoryRequirementsInfo2KHR## b)
          = EQ == cmpImmutableContent a b

        {-# INLINE (==) #-}

instance Ord VkBufferMemoryRequirementsInfo2KHR where
        (VkBufferMemoryRequirementsInfo2KHR## a) `compare`
          (VkBufferMemoryRequirementsInfo2KHR## b) = cmpImmutableContent a b

        {-# INLINE compare #-}

instance Storable VkBufferMemoryRequirementsInfo2KHR where
        sizeOf ~_ = #{size VkBufferMemoryRequirementsInfo2KHR}

        {-# INLINE sizeOf #-}
        alignment ~_
          = #{alignment VkBufferMemoryRequirementsInfo2KHR}

        {-# INLINE alignment #-}
        peek (Ptr addr)
          | I## n <- sizeOf (undefined :: VkBufferMemoryRequirementsInfo2KHR),
            I## a <- alignment (undefined :: VkBufferMemoryRequirementsInfo2KHR)
            =
            IO
              (\ s ->
                 case newAlignedPinnedByteArray## n a s of
                     (## s1, mba ##) -> case copyAddrToByteArray## addr mba 0## n s1 of
                                          s2 -> case unsafeFreezeByteArray## mba s2 of
                                                    (## s3, ba ##) -> (## s3,
                                                                       VkBufferMemoryRequirementsInfo2KHR##
                                                                         ba ##))

        {-# INLINE peek #-}
        poke (Ptr addr) (VkBufferMemoryRequirementsInfo2KHR## ba)
          | I## n <- sizeOf (undefined :: VkBufferMemoryRequirementsInfo2KHR)
            = IO (\ s -> (## copyByteArrayToAddr## ba 0## addr n s, () ##))

        {-# INLINE poke #-}

instance VulkanMarshal VkBufferMemoryRequirementsInfo2KHR where
        {-# INLINE newVkData #-}
        newVkData f
          | I## n <- sizeOf (undefined :: VkBufferMemoryRequirementsInfo2KHR),
            I## a <- alignment (undefined :: VkBufferMemoryRequirementsInfo2KHR)
            =
            IO
              (\ s0 ->
                 case newAlignedPinnedByteArray## n a s0 of
                     (## s1, mba ##) -> case unsafeFreezeByteArray## mba s1 of
                                          (## s2, ba ##) -> case f (Ptr (byteArrayContents## ba)) of
                                                              IO k -> case k s2 of
                                                                          (## s3, () ##) -> (## s3,
                                                                                             VkBufferMemoryRequirementsInfo2KHR##
                                                                                               ba ##))

        {-# INLINE unsafePtr #-}
        unsafePtr (VkBufferMemoryRequirementsInfo2KHR## ba)
          = Ptr (byteArrayContents## ba)

        {-# INLINE fromForeignPtr #-}
        fromForeignPtr
          = fromForeignPtr## VkBufferMemoryRequirementsInfo2KHR##

        {-# INLINE toForeignPtr #-}
        toForeignPtr (VkBufferMemoryRequirementsInfo2KHR## ba)
          = do ForeignPtr addr (PlainForeignPtr r) <- newForeignPtr_
                                                        (Ptr (byteArrayContents## ba))
               IO
                 (\ s -> (## s, ForeignPtr addr (MallocPtr (unsafeCoerce## ba) r) ##))

        {-# INLINE toPlainForeignPtr #-}
        toPlainForeignPtr (VkBufferMemoryRequirementsInfo2KHR## ba)
          = IO
              (\ s ->
                 (## s,
                    ForeignPtr (byteArrayContents## ba)
                      (PlainPtr (unsafeCoerce## ba)) ##))

        {-# INLINE touchVkData #-}
        touchVkData x@(VkBufferMemoryRequirementsInfo2KHR## ba)
          = IO (\ s -> (## touch## x (touch## ba s), () ##))

instance {-# OVERLAPPING #-}
         HasVkSType VkBufferMemoryRequirementsInfo2KHR where
        type VkSTypeMType VkBufferMemoryRequirementsInfo2KHR =
             VkStructureType

        {-# NOINLINE vkSType #-}
        vkSType x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkBufferMemoryRequirementsInfo2KHR, sType})

        {-# INLINE vkSTypeByteOffset #-}
        vkSTypeByteOffset ~_
          = #{offset VkBufferMemoryRequirementsInfo2KHR, sType}

        {-# INLINE readVkSType #-}
        readVkSType p
          = peekByteOff p #{offset VkBufferMemoryRequirementsInfo2KHR, sType}

        {-# INLINE writeVkSType #-}
        writeVkSType p
          = pokeByteOff p #{offset VkBufferMemoryRequirementsInfo2KHR, sType}

instance {-# OVERLAPPING #-}
         HasVkPNext VkBufferMemoryRequirementsInfo2KHR where
        type VkPNextMType VkBufferMemoryRequirementsInfo2KHR = Ptr Void

        {-# NOINLINE vkPNext #-}
        vkPNext x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkBufferMemoryRequirementsInfo2KHR, pNext})

        {-# INLINE vkPNextByteOffset #-}
        vkPNextByteOffset ~_
          = #{offset VkBufferMemoryRequirementsInfo2KHR, pNext}

        {-# INLINE readVkPNext #-}
        readVkPNext p
          = peekByteOff p #{offset VkBufferMemoryRequirementsInfo2KHR, pNext}

        {-# INLINE writeVkPNext #-}
        writeVkPNext p
          = pokeByteOff p #{offset VkBufferMemoryRequirementsInfo2KHR, pNext}

instance {-# OVERLAPPING #-}
         HasVkBuffer VkBufferMemoryRequirementsInfo2KHR where
        type VkBufferMType VkBufferMemoryRequirementsInfo2KHR = VkBuffer

        {-# NOINLINE vkBuffer #-}
        vkBuffer x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkBufferMemoryRequirementsInfo2KHR, buffer})

        {-# INLINE vkBufferByteOffset #-}
        vkBufferByteOffset ~_
          = #{offset VkBufferMemoryRequirementsInfo2KHR, buffer}

        {-# INLINE readVkBuffer #-}
        readVkBuffer p
          = peekByteOff p #{offset VkBufferMemoryRequirementsInfo2KHR, buffer}

        {-# INLINE writeVkBuffer #-}
        writeVkBuffer p
          = pokeByteOff p #{offset VkBufferMemoryRequirementsInfo2KHR, buffer}

instance Show VkBufferMemoryRequirementsInfo2KHR where
        showsPrec d x
          = showString "VkBufferMemoryRequirementsInfo2KHR {" .
              showString "vkSType = " .
                showsPrec d (vkSType x) .
                  showString ", " .
                    showString "vkPNext = " .
                      showsPrec d (vkPNext x) .
                        showString ", " .
                          showString "vkBuffer = " . showsPrec d (vkBuffer x) . showChar '}'

data VkImageMemoryRequirementsInfo2KHR = VkImageMemoryRequirementsInfo2KHR## ByteArray##

instance Eq VkImageMemoryRequirementsInfo2KHR where
        (VkImageMemoryRequirementsInfo2KHR## a) ==
          (VkImageMemoryRequirementsInfo2KHR## b)
          = EQ == cmpImmutableContent a b

        {-# INLINE (==) #-}

instance Ord VkImageMemoryRequirementsInfo2KHR where
        (VkImageMemoryRequirementsInfo2KHR## a) `compare`
          (VkImageMemoryRequirementsInfo2KHR## b) = cmpImmutableContent a b

        {-# INLINE compare #-}

instance Storable VkImageMemoryRequirementsInfo2KHR where
        sizeOf ~_ = #{size VkImageMemoryRequirementsInfo2KHR}

        {-# INLINE sizeOf #-}
        alignment ~_
          = #{alignment VkImageMemoryRequirementsInfo2KHR}

        {-# INLINE alignment #-}
        peek (Ptr addr)
          | I## n <- sizeOf (undefined :: VkImageMemoryRequirementsInfo2KHR),
            I## a <- alignment (undefined :: VkImageMemoryRequirementsInfo2KHR)
            =
            IO
              (\ s ->
                 case newAlignedPinnedByteArray## n a s of
                     (## s1, mba ##) -> case copyAddrToByteArray## addr mba 0## n s1 of
                                          s2 -> case unsafeFreezeByteArray## mba s2 of
                                                    (## s3, ba ##) -> (## s3,
                                                                       VkImageMemoryRequirementsInfo2KHR##
                                                                         ba ##))

        {-# INLINE peek #-}
        poke (Ptr addr) (VkImageMemoryRequirementsInfo2KHR## ba)
          | I## n <- sizeOf (undefined :: VkImageMemoryRequirementsInfo2KHR) =
            IO (\ s -> (## copyByteArrayToAddr## ba 0## addr n s, () ##))

        {-# INLINE poke #-}

instance VulkanMarshal VkImageMemoryRequirementsInfo2KHR where
        {-# INLINE newVkData #-}
        newVkData f
          | I## n <- sizeOf (undefined :: VkImageMemoryRequirementsInfo2KHR),
            I## a <- alignment (undefined :: VkImageMemoryRequirementsInfo2KHR)
            =
            IO
              (\ s0 ->
                 case newAlignedPinnedByteArray## n a s0 of
                     (## s1, mba ##) -> case unsafeFreezeByteArray## mba s1 of
                                          (## s2, ba ##) -> case f (Ptr (byteArrayContents## ba)) of
                                                              IO k -> case k s2 of
                                                                          (## s3, () ##) -> (## s3,
                                                                                             VkImageMemoryRequirementsInfo2KHR##
                                                                                               ba ##))

        {-# INLINE unsafePtr #-}
        unsafePtr (VkImageMemoryRequirementsInfo2KHR## ba)
          = Ptr (byteArrayContents## ba)

        {-# INLINE fromForeignPtr #-}
        fromForeignPtr = fromForeignPtr## VkImageMemoryRequirementsInfo2KHR##

        {-# INLINE toForeignPtr #-}
        toForeignPtr (VkImageMemoryRequirementsInfo2KHR## ba)
          = do ForeignPtr addr (PlainForeignPtr r) <- newForeignPtr_
                                                        (Ptr (byteArrayContents## ba))
               IO
                 (\ s -> (## s, ForeignPtr addr (MallocPtr (unsafeCoerce## ba) r) ##))

        {-# INLINE toPlainForeignPtr #-}
        toPlainForeignPtr (VkImageMemoryRequirementsInfo2KHR## ba)
          = IO
              (\ s ->
                 (## s,
                    ForeignPtr (byteArrayContents## ba)
                      (PlainPtr (unsafeCoerce## ba)) ##))

        {-# INLINE touchVkData #-}
        touchVkData x@(VkImageMemoryRequirementsInfo2KHR## ba)
          = IO (\ s -> (## touch## x (touch## ba s), () ##))

instance {-# OVERLAPPING #-}
         HasVkSType VkImageMemoryRequirementsInfo2KHR where
        type VkSTypeMType VkImageMemoryRequirementsInfo2KHR =
             VkStructureType

        {-# NOINLINE vkSType #-}
        vkSType x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkImageMemoryRequirementsInfo2KHR, sType})

        {-# INLINE vkSTypeByteOffset #-}
        vkSTypeByteOffset ~_
          = #{offset VkImageMemoryRequirementsInfo2KHR, sType}

        {-# INLINE readVkSType #-}
        readVkSType p
          = peekByteOff p #{offset VkImageMemoryRequirementsInfo2KHR, sType}

        {-# INLINE writeVkSType #-}
        writeVkSType p
          = pokeByteOff p #{offset VkImageMemoryRequirementsInfo2KHR, sType}

instance {-# OVERLAPPING #-}
         HasVkPNext VkImageMemoryRequirementsInfo2KHR where
        type VkPNextMType VkImageMemoryRequirementsInfo2KHR = Ptr Void

        {-# NOINLINE vkPNext #-}
        vkPNext x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkImageMemoryRequirementsInfo2KHR, pNext})

        {-# INLINE vkPNextByteOffset #-}
        vkPNextByteOffset ~_
          = #{offset VkImageMemoryRequirementsInfo2KHR, pNext}

        {-# INLINE readVkPNext #-}
        readVkPNext p
          = peekByteOff p #{offset VkImageMemoryRequirementsInfo2KHR, pNext}

        {-# INLINE writeVkPNext #-}
        writeVkPNext p
          = pokeByteOff p #{offset VkImageMemoryRequirementsInfo2KHR, pNext}

instance {-# OVERLAPPING #-}
         HasVkImage VkImageMemoryRequirementsInfo2KHR where
        type VkImageMType VkImageMemoryRequirementsInfo2KHR = VkImage

        {-# NOINLINE vkImage #-}
        vkImage x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkImageMemoryRequirementsInfo2KHR, image})

        {-# INLINE vkImageByteOffset #-}
        vkImageByteOffset ~_
          = #{offset VkImageMemoryRequirementsInfo2KHR, image}

        {-# INLINE readVkImage #-}
        readVkImage p
          = peekByteOff p #{offset VkImageMemoryRequirementsInfo2KHR, image}

        {-# INLINE writeVkImage #-}
        writeVkImage p
          = pokeByteOff p #{offset VkImageMemoryRequirementsInfo2KHR, image}

instance Show VkImageMemoryRequirementsInfo2KHR where
        showsPrec d x
          = showString "VkImageMemoryRequirementsInfo2KHR {" .
              showString "vkSType = " .
                showsPrec d (vkSType x) .
                  showString ", " .
                    showString "vkPNext = " .
                      showsPrec d (vkPNext x) .
                        showString ", " .
                          showString "vkImage = " . showsPrec d (vkImage x) . showChar '}'

data VkImageSparseMemoryRequirementsInfo2KHR = VkImageSparseMemoryRequirementsInfo2KHR## ByteArray##

instance Eq VkImageSparseMemoryRequirementsInfo2KHR where
        (VkImageSparseMemoryRequirementsInfo2KHR## a) ==
          (VkImageSparseMemoryRequirementsInfo2KHR## b)
          = EQ == cmpImmutableContent a b

        {-# INLINE (==) #-}

instance Ord VkImageSparseMemoryRequirementsInfo2KHR where
        (VkImageSparseMemoryRequirementsInfo2KHR## a) `compare`
          (VkImageSparseMemoryRequirementsInfo2KHR## b)
          = cmpImmutableContent a b

        {-# INLINE compare #-}

instance Storable VkImageSparseMemoryRequirementsInfo2KHR where
        sizeOf ~_
          = #{size VkImageSparseMemoryRequirementsInfo2KHR}

        {-# INLINE sizeOf #-}
        alignment ~_
          = #{alignment VkImageSparseMemoryRequirementsInfo2KHR}

        {-# INLINE alignment #-}
        peek (Ptr addr)
          | I## n <- sizeOf
                      (undefined :: VkImageSparseMemoryRequirementsInfo2KHR),
            I## a <- alignment
                      (undefined :: VkImageSparseMemoryRequirementsInfo2KHR)
            =
            IO
              (\ s ->
                 case newAlignedPinnedByteArray## n a s of
                     (## s1, mba ##) -> case copyAddrToByteArray## addr mba 0## n s1 of
                                          s2 -> case unsafeFreezeByteArray## mba s2 of
                                                    (## s3, ba ##) -> (## s3,
                                                                       VkImageSparseMemoryRequirementsInfo2KHR##
                                                                         ba ##))

        {-# INLINE peek #-}
        poke (Ptr addr) (VkImageSparseMemoryRequirementsInfo2KHR## ba)
          | I## n <- sizeOf
                      (undefined :: VkImageSparseMemoryRequirementsInfo2KHR)
            = IO (\ s -> (## copyByteArrayToAddr## ba 0## addr n s, () ##))

        {-# INLINE poke #-}

instance VulkanMarshal VkImageSparseMemoryRequirementsInfo2KHR
         where
        {-# INLINE newVkData #-}
        newVkData f
          | I## n <- sizeOf
                      (undefined :: VkImageSparseMemoryRequirementsInfo2KHR),
            I## a <- alignment
                      (undefined :: VkImageSparseMemoryRequirementsInfo2KHR)
            =
            IO
              (\ s0 ->
                 case newAlignedPinnedByteArray## n a s0 of
                     (## s1, mba ##) -> case unsafeFreezeByteArray## mba s1 of
                                          (## s2, ba ##) -> case f (Ptr (byteArrayContents## ba)) of
                                                              IO k -> case k s2 of
                                                                          (## s3, () ##) -> (## s3,
                                                                                             VkImageSparseMemoryRequirementsInfo2KHR##
                                                                                               ba ##))

        {-# INLINE unsafePtr #-}
        unsafePtr (VkImageSparseMemoryRequirementsInfo2KHR## ba)
          = Ptr (byteArrayContents## ba)

        {-# INLINE fromForeignPtr #-}
        fromForeignPtr
          = fromForeignPtr## VkImageSparseMemoryRequirementsInfo2KHR##

        {-# INLINE toForeignPtr #-}
        toForeignPtr (VkImageSparseMemoryRequirementsInfo2KHR## ba)
          = do ForeignPtr addr (PlainForeignPtr r) <- newForeignPtr_
                                                        (Ptr (byteArrayContents## ba))
               IO
                 (\ s -> (## s, ForeignPtr addr (MallocPtr (unsafeCoerce## ba) r) ##))

        {-# INLINE toPlainForeignPtr #-}
        toPlainForeignPtr (VkImageSparseMemoryRequirementsInfo2KHR## ba)
          = IO
              (\ s ->
                 (## s,
                    ForeignPtr (byteArrayContents## ba)
                      (PlainPtr (unsafeCoerce## ba)) ##))

        {-# INLINE touchVkData #-}
        touchVkData x@(VkImageSparseMemoryRequirementsInfo2KHR## ba)
          = IO (\ s -> (## touch## x (touch## ba s), () ##))

instance {-# OVERLAPPING #-}
         HasVkSType VkImageSparseMemoryRequirementsInfo2KHR where
        type VkSTypeMType VkImageSparseMemoryRequirementsInfo2KHR =
             VkStructureType

        {-# NOINLINE vkSType #-}
        vkSType x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkImageSparseMemoryRequirementsInfo2KHR, sType})

        {-# INLINE vkSTypeByteOffset #-}
        vkSTypeByteOffset ~_
          = #{offset VkImageSparseMemoryRequirementsInfo2KHR, sType}

        {-# INLINE readVkSType #-}
        readVkSType p
          = peekByteOff p #{offset VkImageSparseMemoryRequirementsInfo2KHR, sType}

        {-# INLINE writeVkSType #-}
        writeVkSType p
          = pokeByteOff p #{offset VkImageSparseMemoryRequirementsInfo2KHR, sType}

instance {-# OVERLAPPING #-}
         HasVkPNext VkImageSparseMemoryRequirementsInfo2KHR where
        type VkPNextMType VkImageSparseMemoryRequirementsInfo2KHR =
             Ptr Void

        {-# NOINLINE vkPNext #-}
        vkPNext x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkImageSparseMemoryRequirementsInfo2KHR, pNext})

        {-# INLINE vkPNextByteOffset #-}
        vkPNextByteOffset ~_
          = #{offset VkImageSparseMemoryRequirementsInfo2KHR, pNext}

        {-# INLINE readVkPNext #-}
        readVkPNext p
          = peekByteOff p #{offset VkImageSparseMemoryRequirementsInfo2KHR, pNext}

        {-# INLINE writeVkPNext #-}
        writeVkPNext p
          = pokeByteOff p #{offset VkImageSparseMemoryRequirementsInfo2KHR, pNext}

instance {-# OVERLAPPING #-}
         HasVkImage VkImageSparseMemoryRequirementsInfo2KHR where
        type VkImageMType VkImageSparseMemoryRequirementsInfo2KHR = VkImage

        {-# NOINLINE vkImage #-}
        vkImage x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkImageSparseMemoryRequirementsInfo2KHR, image})

        {-# INLINE vkImageByteOffset #-}
        vkImageByteOffset ~_
          = #{offset VkImageSparseMemoryRequirementsInfo2KHR, image}

        {-# INLINE readVkImage #-}
        readVkImage p
          = peekByteOff p #{offset VkImageSparseMemoryRequirementsInfo2KHR, image}

        {-# INLINE writeVkImage #-}
        writeVkImage p
          = pokeByteOff p #{offset VkImageSparseMemoryRequirementsInfo2KHR, image}

instance Show VkImageSparseMemoryRequirementsInfo2KHR where
        showsPrec d x
          = showString "VkImageSparseMemoryRequirementsInfo2KHR {" .
              showString "vkSType = " .
                showsPrec d (vkSType x) .
                  showString ", " .
                    showString "vkPNext = " .
                      showsPrec d (vkPNext x) .
                        showString ", " .
                          showString "vkImage = " . showsPrec d (vkImage x) . showChar '}'

data VkMemoryRequirements2KHR = VkMemoryRequirements2KHR## ByteArray##

instance Eq VkMemoryRequirements2KHR where
        (VkMemoryRequirements2KHR## a) == (VkMemoryRequirements2KHR## b)
          = EQ == cmpImmutableContent a b

        {-# INLINE (==) #-}

instance Ord VkMemoryRequirements2KHR where
        (VkMemoryRequirements2KHR## a) `compare`
          (VkMemoryRequirements2KHR## b) = cmpImmutableContent a b

        {-# INLINE compare #-}

instance Storable VkMemoryRequirements2KHR where
        sizeOf ~_ = #{size VkMemoryRequirements2KHR}

        {-# INLINE sizeOf #-}
        alignment ~_ = #{alignment VkMemoryRequirements2KHR}

        {-# INLINE alignment #-}
        peek (Ptr addr)
          | I## n <- sizeOf (undefined :: VkMemoryRequirements2KHR),
            I## a <- alignment (undefined :: VkMemoryRequirements2KHR) =
            IO
              (\ s ->
                 case newAlignedPinnedByteArray## n a s of
                     (## s1, mba ##) -> case copyAddrToByteArray## addr mba 0## n s1 of
                                          s2 -> case unsafeFreezeByteArray## mba s2 of
                                                    (## s3, ba ##) -> (## s3,
                                                                       VkMemoryRequirements2KHR##
                                                                         ba ##))

        {-# INLINE peek #-}
        poke (Ptr addr) (VkMemoryRequirements2KHR## ba)
          | I## n <- sizeOf (undefined :: VkMemoryRequirements2KHR) =
            IO (\ s -> (## copyByteArrayToAddr## ba 0## addr n s, () ##))

        {-# INLINE poke #-}

instance VulkanMarshal VkMemoryRequirements2KHR where
        {-# INLINE newVkData #-}
        newVkData f
          | I## n <- sizeOf (undefined :: VkMemoryRequirements2KHR),
            I## a <- alignment (undefined :: VkMemoryRequirements2KHR) =
            IO
              (\ s0 ->
                 case newAlignedPinnedByteArray## n a s0 of
                     (## s1, mba ##) -> case unsafeFreezeByteArray## mba s1 of
                                          (## s2, ba ##) -> case f (Ptr (byteArrayContents## ba)) of
                                                              IO k -> case k s2 of
                                                                          (## s3, () ##) -> (## s3,
                                                                                             VkMemoryRequirements2KHR##
                                                                                               ba ##))

        {-# INLINE unsafePtr #-}
        unsafePtr (VkMemoryRequirements2KHR## ba)
          = Ptr (byteArrayContents## ba)

        {-# INLINE fromForeignPtr #-}
        fromForeignPtr = fromForeignPtr## VkMemoryRequirements2KHR##

        {-# INLINE toForeignPtr #-}
        toForeignPtr (VkMemoryRequirements2KHR## ba)
          = do ForeignPtr addr (PlainForeignPtr r) <- newForeignPtr_
                                                        (Ptr (byteArrayContents## ba))
               IO
                 (\ s -> (## s, ForeignPtr addr (MallocPtr (unsafeCoerce## ba) r) ##))

        {-# INLINE toPlainForeignPtr #-}
        toPlainForeignPtr (VkMemoryRequirements2KHR## ba)
          = IO
              (\ s ->
                 (## s,
                    ForeignPtr (byteArrayContents## ba)
                      (PlainPtr (unsafeCoerce## ba)) ##))

        {-# INLINE touchVkData #-}
        touchVkData x@(VkMemoryRequirements2KHR## ba)
          = IO (\ s -> (## touch## x (touch## ba s), () ##))

instance {-# OVERLAPPING #-} HasVkSType VkMemoryRequirements2KHR
         where
        type VkSTypeMType VkMemoryRequirements2KHR = VkStructureType

        {-# NOINLINE vkSType #-}
        vkSType x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkMemoryRequirements2KHR, sType})

        {-# INLINE vkSTypeByteOffset #-}
        vkSTypeByteOffset ~_
          = #{offset VkMemoryRequirements2KHR, sType}

        {-# INLINE readVkSType #-}
        readVkSType p
          = peekByteOff p #{offset VkMemoryRequirements2KHR, sType}

        {-# INLINE writeVkSType #-}
        writeVkSType p
          = pokeByteOff p #{offset VkMemoryRequirements2KHR, sType}

instance {-# OVERLAPPING #-} HasVkPNext VkMemoryRequirements2KHR
         where
        type VkPNextMType VkMemoryRequirements2KHR = Ptr Void

        {-# NOINLINE vkPNext #-}
        vkPNext x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkMemoryRequirements2KHR, pNext})

        {-# INLINE vkPNextByteOffset #-}
        vkPNextByteOffset ~_
          = #{offset VkMemoryRequirements2KHR, pNext}

        {-# INLINE readVkPNext #-}
        readVkPNext p
          = peekByteOff p #{offset VkMemoryRequirements2KHR, pNext}

        {-# INLINE writeVkPNext #-}
        writeVkPNext p
          = pokeByteOff p #{offset VkMemoryRequirements2KHR, pNext}

instance {-# OVERLAPPING #-}
         HasVkMemoryRequirements VkMemoryRequirements2KHR where
        type VkMemoryRequirementsMType VkMemoryRequirements2KHR =
             VkMemoryRequirements

        {-# NOINLINE vkMemoryRequirements #-}
        vkMemoryRequirements x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkMemoryRequirements2KHR, memoryRequirements})

        {-# INLINE vkMemoryRequirementsByteOffset #-}
        vkMemoryRequirementsByteOffset ~_
          = #{offset VkMemoryRequirements2KHR, memoryRequirements}

        {-# INLINE readVkMemoryRequirements #-}
        readVkMemoryRequirements p
          = peekByteOff p #{offset VkMemoryRequirements2KHR, memoryRequirements}

        {-# INLINE writeVkMemoryRequirements #-}
        writeVkMemoryRequirements p
          = pokeByteOff p #{offset VkMemoryRequirements2KHR, memoryRequirements}

instance Show VkMemoryRequirements2KHR where
        showsPrec d x
          = showString "VkMemoryRequirements2KHR {" .
              showString "vkSType = " .
                showsPrec d (vkSType x) .
                  showString ", " .
                    showString "vkPNext = " .
                      showsPrec d (vkPNext x) .
                        showString ", " .
                          showString "vkMemoryRequirements = " .
                            showsPrec d (vkMemoryRequirements x) . showChar '}'

data VkSparseImageMemoryRequirements2KHR = VkSparseImageMemoryRequirements2KHR## ByteArray##

instance Eq VkSparseImageMemoryRequirements2KHR where
        (VkSparseImageMemoryRequirements2KHR## a) ==
          (VkSparseImageMemoryRequirements2KHR## b)
          = EQ == cmpImmutableContent a b

        {-# INLINE (==) #-}

instance Ord VkSparseImageMemoryRequirements2KHR where
        (VkSparseImageMemoryRequirements2KHR## a) `compare`
          (VkSparseImageMemoryRequirements2KHR## b) = cmpImmutableContent a b

        {-# INLINE compare #-}

instance Storable VkSparseImageMemoryRequirements2KHR where
        sizeOf ~_ = #{size VkSparseImageMemoryRequirements2KHR}

        {-# INLINE sizeOf #-}
        alignment ~_
          = #{alignment VkSparseImageMemoryRequirements2KHR}

        {-# INLINE alignment #-}
        peek (Ptr addr)
          | I## n <- sizeOf
                      (undefined :: VkSparseImageMemoryRequirements2KHR),
            I## a <- alignment
                      (undefined :: VkSparseImageMemoryRequirements2KHR)
            =
            IO
              (\ s ->
                 case newAlignedPinnedByteArray## n a s of
                     (## s1, mba ##) -> case copyAddrToByteArray## addr mba 0## n s1 of
                                          s2 -> case unsafeFreezeByteArray## mba s2 of
                                                    (## s3, ba ##) -> (## s3,
                                                                       VkSparseImageMemoryRequirements2KHR##
                                                                         ba ##))

        {-# INLINE peek #-}
        poke (Ptr addr) (VkSparseImageMemoryRequirements2KHR## ba)
          | I## n <- sizeOf (undefined :: VkSparseImageMemoryRequirements2KHR)
            = IO (\ s -> (## copyByteArrayToAddr## ba 0## addr n s, () ##))

        {-# INLINE poke #-}

instance VulkanMarshal VkSparseImageMemoryRequirements2KHR where
        {-# INLINE newVkData #-}
        newVkData f
          | I## n <- sizeOf
                      (undefined :: VkSparseImageMemoryRequirements2KHR),
            I## a <- alignment
                      (undefined :: VkSparseImageMemoryRequirements2KHR)
            =
            IO
              (\ s0 ->
                 case newAlignedPinnedByteArray## n a s0 of
                     (## s1, mba ##) -> case unsafeFreezeByteArray## mba s1 of
                                          (## s2, ba ##) -> case f (Ptr (byteArrayContents## ba)) of
                                                              IO k -> case k s2 of
                                                                          (## s3, () ##) -> (## s3,
                                                                                             VkSparseImageMemoryRequirements2KHR##
                                                                                               ba ##))

        {-# INLINE unsafePtr #-}
        unsafePtr (VkSparseImageMemoryRequirements2KHR## ba)
          = Ptr (byteArrayContents## ba)

        {-# INLINE fromForeignPtr #-}
        fromForeignPtr
          = fromForeignPtr## VkSparseImageMemoryRequirements2KHR##

        {-# INLINE toForeignPtr #-}
        toForeignPtr (VkSparseImageMemoryRequirements2KHR## ba)
          = do ForeignPtr addr (PlainForeignPtr r) <- newForeignPtr_
                                                        (Ptr (byteArrayContents## ba))
               IO
                 (\ s -> (## s, ForeignPtr addr (MallocPtr (unsafeCoerce## ba) r) ##))

        {-# INLINE toPlainForeignPtr #-}
        toPlainForeignPtr (VkSparseImageMemoryRequirements2KHR## ba)
          = IO
              (\ s ->
                 (## s,
                    ForeignPtr (byteArrayContents## ba)
                      (PlainPtr (unsafeCoerce## ba)) ##))

        {-# INLINE touchVkData #-}
        touchVkData x@(VkSparseImageMemoryRequirements2KHR## ba)
          = IO (\ s -> (## touch## x (touch## ba s), () ##))

instance {-# OVERLAPPING #-}
         HasVkSType VkSparseImageMemoryRequirements2KHR where
        type VkSTypeMType VkSparseImageMemoryRequirements2KHR =
             VkStructureType

        {-# NOINLINE vkSType #-}
        vkSType x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkSparseImageMemoryRequirements2KHR, sType})

        {-# INLINE vkSTypeByteOffset #-}
        vkSTypeByteOffset ~_
          = #{offset VkSparseImageMemoryRequirements2KHR, sType}

        {-# INLINE readVkSType #-}
        readVkSType p
          = peekByteOff p #{offset VkSparseImageMemoryRequirements2KHR, sType}

        {-# INLINE writeVkSType #-}
        writeVkSType p
          = pokeByteOff p #{offset VkSparseImageMemoryRequirements2KHR, sType}

instance {-# OVERLAPPING #-}
         HasVkPNext VkSparseImageMemoryRequirements2KHR where
        type VkPNextMType VkSparseImageMemoryRequirements2KHR = Ptr Void

        {-# NOINLINE vkPNext #-}
        vkPNext x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkSparseImageMemoryRequirements2KHR, pNext})

        {-# INLINE vkPNextByteOffset #-}
        vkPNextByteOffset ~_
          = #{offset VkSparseImageMemoryRequirements2KHR, pNext}

        {-# INLINE readVkPNext #-}
        readVkPNext p
          = peekByteOff p #{offset VkSparseImageMemoryRequirements2KHR, pNext}

        {-# INLINE writeVkPNext #-}
        writeVkPNext p
          = pokeByteOff p #{offset VkSparseImageMemoryRequirements2KHR, pNext}

instance {-# OVERLAPPING #-}
         HasVkMemoryRequirements VkSparseImageMemoryRequirements2KHR where
        type VkMemoryRequirementsMType VkSparseImageMemoryRequirements2KHR
             = VkSparseImageMemoryRequirements

        {-# NOINLINE vkMemoryRequirements #-}
        vkMemoryRequirements x
          = unsafeDupablePerformIO
              (peekByteOff (unsafePtr x) #{offset VkSparseImageMemoryRequirements2KHR, memoryRequirements})

        {-# INLINE vkMemoryRequirementsByteOffset #-}
        vkMemoryRequirementsByteOffset ~_
          = #{offset VkSparseImageMemoryRequirements2KHR, memoryRequirements}

        {-# INLINE readVkMemoryRequirements #-}
        readVkMemoryRequirements p
          = peekByteOff p #{offset VkSparseImageMemoryRequirements2KHR, memoryRequirements}

        {-# INLINE writeVkMemoryRequirements #-}
        writeVkMemoryRequirements p
          = pokeByteOff p #{offset VkSparseImageMemoryRequirements2KHR, memoryRequirements}

instance Show VkSparseImageMemoryRequirements2KHR where
        showsPrec d x
          = showString "VkSparseImageMemoryRequirements2KHR {" .
              showString "vkSType = " .
                showsPrec d (vkSType x) .
                  showString ", " .
                    showString "vkPNext = " .
                      showsPrec d (vkPNext x) .
                        showString ", " .
                          showString "vkMemoryRequirements = " .
                            showsPrec d (vkMemoryRequirements x) . showChar '}'

-- | > void vkGetImageMemoryRequirements2KHR
--   >     ( VkDevice device
--   >     , const VkImageMemoryRequirementsInfo2KHR* pInfo
--   >     , VkMemoryRequirements2KHR* pMemoryRequirements
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkGetImageMemoryRequirements2KHR.html vkGetImageMemoryRequirements2KHR registry at www.khronos.org>
foreign import ccall unsafe "vkGetImageMemoryRequirements2KHR"
               vkGetImageMemoryRequirements2KHR ::
               VkDevice -- ^ device
                        ->
                 Ptr VkImageMemoryRequirementsInfo2KHR -- ^ pInfo
                                                       ->
                   Ptr VkMemoryRequirements2KHR -- ^ pMemoryRequirements
                                                -> IO ()

-- | > void vkGetBufferMemoryRequirements2KHR
--   >     ( VkDevice device
--   >     , const VkBufferMemoryRequirementsInfo2KHR* pInfo
--   >     , VkMemoryRequirements2KHR* pMemoryRequirements
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkGetBufferMemoryRequirements2KHR.html vkGetBufferMemoryRequirements2KHR registry at www.khronos.org>
foreign import ccall unsafe "vkGetBufferMemoryRequirements2KHR"
               vkGetBufferMemoryRequirements2KHR ::
               VkDevice -- ^ device
                        ->
                 Ptr VkBufferMemoryRequirementsInfo2KHR -- ^ pInfo
                                                        ->
                   Ptr VkMemoryRequirements2KHR -- ^ pMemoryRequirements
                                                -> IO ()

-- | > void vkGetImageSparseMemoryRequirements2KHR
--   >     ( VkDevice device
--   >     , const VkImageSparseMemoryRequirementsInfo2KHR* pInfo
--   >     , uint32_t* pSparseMemoryRequirementCount
--   >     , VkSparseImageMemoryRequirements2KHR* pSparseMemoryRequirements
--   >     )
--
--   <https://www.khronos.org/registry/vulkan/specs/1.0/man/html/vkGetImageSparseMemoryRequirements2KHR.html vkGetImageSparseMemoryRequirements2KHR registry at www.khronos.org>
foreign import ccall unsafe
               "vkGetImageSparseMemoryRequirements2KHR"
               vkGetImageSparseMemoryRequirements2KHR ::
               VkDevice -- ^ device
                        ->
                 Ptr VkImageSparseMemoryRequirementsInfo2KHR -- ^ pInfo
                                                             ->
                   Ptr Data.Word.Word32 -- ^ pSparseMemoryRequirementCount
                                        ->
                     Ptr VkSparseImageMemoryRequirements2KHR -- ^ pSparseMemoryRequirements
                                                             -> IO ()

pattern VK_KHR_GET_MEMORY_REQUIREMENTS_2_SPEC_VERSION ::
        (Num a, Eq a) => a

pattern VK_KHR_GET_MEMORY_REQUIREMENTS_2_SPEC_VERSION = 1

type VK_KHR_GET_MEMORY_REQUIREMENTS_2_SPEC_VERSION = 1

pattern VK_KHR_GET_MEMORY_REQUIREMENTS_2_EXTENSION_NAME :: CString

pattern VK_KHR_GET_MEMORY_REQUIREMENTS_2_EXTENSION_NAME <-
        (is_VK_KHR_GET_MEMORY_REQUIREMENTS_2_EXTENSION_NAME -> True)
  where VK_KHR_GET_MEMORY_REQUIREMENTS_2_EXTENSION_NAME
          = _VK_KHR_GET_MEMORY_REQUIREMENTS_2_EXTENSION_NAME

_VK_KHR_GET_MEMORY_REQUIREMENTS_2_EXTENSION_NAME :: CString

{-# INLINE _VK_KHR_GET_MEMORY_REQUIREMENTS_2_EXTENSION_NAME #-}
_VK_KHR_GET_MEMORY_REQUIREMENTS_2_EXTENSION_NAME
  = Ptr "VK_KHR_get_memory_requirements2\NUL"##

is_VK_KHR_GET_MEMORY_REQUIREMENTS_2_EXTENSION_NAME ::
                                                   CString -> Bool

{-# INLINE is_VK_KHR_GET_MEMORY_REQUIREMENTS_2_EXTENSION_NAME #-}
is_VK_KHR_GET_MEMORY_REQUIREMENTS_2_EXTENSION_NAME
  = (_VK_KHR_GET_MEMORY_REQUIREMENTS_2_EXTENSION_NAME ==)

type VK_KHR_GET_MEMORY_REQUIREMENTS_2_EXTENSION_NAME =
     "VK_KHR_get_memory_requirements2"

pattern VK_STRUCTURE_TYPE_BUFFER_MEMORY_REQUIREMENTS_INFO_2_KHR ::
        VkStructureType

pattern VK_STRUCTURE_TYPE_BUFFER_MEMORY_REQUIREMENTS_INFO_2_KHR =
        VkStructureType 1000146000

pattern VK_STRUCTURE_TYPE_IMAGE_MEMORY_REQUIREMENTS_INFO_2_KHR ::
        VkStructureType

pattern VK_STRUCTURE_TYPE_IMAGE_MEMORY_REQUIREMENTS_INFO_2_KHR =
        VkStructureType 1000146001

pattern VK_STRUCTURE_TYPE_IMAGE_SPARSE_MEMORY_REQUIREMENTS_INFO_2_KHR
        :: VkStructureType

pattern VK_STRUCTURE_TYPE_IMAGE_SPARSE_MEMORY_REQUIREMENTS_INFO_2_KHR
        = VkStructureType 1000146002

pattern VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2_KHR ::
        VkStructureType

pattern VK_STRUCTURE_TYPE_MEMORY_REQUIREMENTS_2_KHR =
        VkStructureType 1000146003

pattern VK_STRUCTURE_TYPE_SPARSE_IMAGE_MEMORY_REQUIREMENTS_2_KHR ::
        VkStructureType

pattern VK_STRUCTURE_TYPE_SPARSE_IMAGE_MEMORY_REQUIREMENTS_2_KHR =
        VkStructureType 1000146004

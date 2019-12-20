import React from 'react'
import { Image } from 'cloudinary-react'

const ImageItem = image => (
  <div className="w-1/4 pr-1">
    <Image
      cloudName="dkrjpli3y"
      publicId={image}
      aspectRatio="4:3"
      crop="crop"
      className="w-full object-cover"
    />
  </div>
)

const Gallery = ({ images }) => {
  return (
    <div className="flex -mr-1">{images.map(image => ImageItem(image))}</div>
  )
}

export default Gallery

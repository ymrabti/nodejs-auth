const axios = require('axios');
const { createWriteStream, mkdirSync, existsSync } = require('fs');
const { join } = require('path');
const logger = require('../config/logger');

/**
 * Function to download and save image from URL
 * @param {*} imageUrl image url
 * @param {*} folderPath path folder
 * @param {*} imageName image name
 * @returns a promise
 */
async function saveImageToFolder(imageUrl, folderPath, imageName) {
  try {
    const response = await axios.get(imageUrl, { responseType: 'stream' });
    logger.info(imageName);
    const filePath = join(folderPath, imageName);
    const writer = createWriteStream(filePath);
    response.data.pipe(writer);
    return new Promise((resolve, reject) => {
      writer.on('finish', resolve);
      writer.on('error', reject);
    });
  } catch (error) {
    logger.error('Error saving image:', error);
    throw error;
  }
}

/**
 * save list of pictures
 * @param {any[]} images list od urls
 * @param {string} folderPath relative folderpath
 * @param {string} token token
 */
async function saveImages(images, folderPath, token) {
  // Create the folder if it doesn't exist
  if (!existsSync(folderPath)) {
    mkdirSync(folderPath, { recursive: true });
  }

  await Promise.all(
    images.map(async (attach) => {
      const imageURL = `${attach.url}?token=${token}`;
      await saveImageToFolder(imageURL, folderPath, attach.name);
    })
  );
}

module.exports = {
  saveImageToFolder,
  saveImages,
};

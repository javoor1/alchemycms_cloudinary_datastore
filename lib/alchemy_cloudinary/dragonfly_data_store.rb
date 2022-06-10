# frozen_string_literal: true

require 'cloudinary'

module AlchemyCloudinary
  class DragonflyDataStore
    # def write(content, opts = {})
    #   result = Cloudinary::Uploader.upload(content.file, {
    #     public_id: name(content.name)
    #   }.merge(opts))
    #   "#{result['public_id']}.#{result['format']}"
    # end

    # def read(uid)
    #   url = Cloudinary::Utils.cloudinary_url(public_id(uid), format: ext(uid) || 'jpg')
    #   [Cloudinary::Downloader.download(url), {'name' => name(uid)}]
    # end

    # def destroy(uid)
    #   Cloudinary::Uploader.destroy public_id(uid)
    # end

    def write(content, opts={})
      result = Cloudinary::Uploader.upload(content.path, { tags: serialize_hash(content.meta) })
      "#{result['public_id']}.#{result['format']}"
    end

    def read(uid)
      resource = Cloudinary::Api.resource(File.basename(uid, File.extname(uid)))
      [Cloudinary::Downloader.download(uid), deserialize_to_hash(resource['tags'])]
    end

    def destroy(uid)
      Cloudinary::Uploader.destroy(uid)
    end

    def url_for(uid, options = {})
      options = {format: ext(uid)}.merge(options)
      Cloudinary::Utils.cloudinary_url(public_id(uid), options)
    end

    private

    def public_id(uid)
      File.basename(uid, ext(uid, true))
    end

    # def name(uid)
    #   pid = public_id(uid)
    #   if pid.include?('_')
    #     public_id(uid).split('_')[0..-1].join
    #   else
    #     pid
    #   end
    # end

    def ext(uid, with_dot = false)
      ext = File.extname(uid)
      ext[0] = '' if ext && !with_dot
      ext
    end

    def serialize_hash(hash)
      return hash if hash.nil?
      hash.map { |k, v| "#{k}=>#{v}"}
    end

    def deserialize_to_hash(str_arr)
      return str_arr if str_arr.nil?
      res = str_arr.map { |x| x.split("=>") }.flatten
      hash = Hash[*res.flatten]
      hash
    end
  end
end

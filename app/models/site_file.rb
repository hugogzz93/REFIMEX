class SiteFile < ApplicationRecord
	 has_attached_file :certification
	 validates_attachment_content_type :certification, :content_type => [
	 			'image/jpeg',
        'image/pjpeg',
        'image/png',
        'image/gif',
        'application/pdf',
        'text/plain',
        'application/zip',
        'application/x-bzip',
        'application/x-bzip2',
        'application/x-7z-compressed',
        'application/vnd.ms-excel',
        'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
        'application/vnd.ms-excel.sheet.binary.macroenabled.12',
        'application/vnd.ms-excel.template.macroenabled.12',
        'application/vnd.ms-excel.sheet.macroenabled.12',
        'application/vnd.google-earth.kmz']

end

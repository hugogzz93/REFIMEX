class SiteFile < ApplicationRecord
	 has_attached_file :certification
	 validates_attachment_content_type :certification, :content_type => [
	 			'image/jpeg',
        'image/pjpeg',
        'image/png',
        'image/gif',
        'application/pdf',
        'text/plain',
        'application/vnd.ms-excel',
        'application/vnd.openxmlformats-officedocument.wordprocessingml.document']
end

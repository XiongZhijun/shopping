package shopping.grails

import grails.converters.JSON
import static org.codehaus.groovy.grails.commons.ConfigurationHolder.config as Config
import org.springframework.http.HttpStatus
import uk.co.desirableobjects.ajaxuploader.AjaxUploaderService
import uk.co.desirableobjects.ajaxuploader.exception.FileUploadException
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile
import org.springframework.web.multipart.MultipartFile
import javax.servlet.http.HttpServletRequest
import org.codehaus.groovy.grails.web.context.ServletContextHolder

class AjaxUploadController {

	AjaxUploaderService ajaxUploaderService

	def upload = {
		try {
			println params
			File uploaded = createTemporaryFile()
			log.debug("uploaded to " + uploaded.absolutePath)
			InputStream inputStream = selectInputStream(request)

			ajaxUploaderService.upload(inputStream, uploaded)

			return render(text: [success:true] as JSON, contentType:'text/json')
		} catch (FileUploadException e) {

			log.error("Failed to upload file.", e)
			return render(text: [success:false] as JSON, contentType:'text/json')
		}
	}

	private InputStream selectInputStream(HttpServletRequest request) {
		if (request instanceof MultipartHttpServletRequest) {
			MultipartFile uploadedFile = ((MultipartHttpServletRequest) request).getFile('qqfile')
			return uploadedFile.inputStream
		}
		return request.inputStream
	}

	private File createTemporaryFile() {
		File uploaded
		def servletContext = ServletContextHolder.servletContext
		def storagePath = servletContext.getRealPath(Config.imageUpload.temporaryDir)
		File dir = new File(storagePath)
		if (!dir.exists() && dir.mkdir()) {
			throw new IllegalArgumentException("create upload file's dir failed. dir is : " + storagePath);
		}

		if (Config.imageUpload?.containsKey('temporaryFile')) {
			uploaded = new File(storagePath, params['qqfile'])
		} else {
			uploaded = File.createTempFile('grails', 'ajaxupload')
		}
		return uploaded
	}
}

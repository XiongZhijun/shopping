security {
	
			ui {
	
					encodePassword = false
	
					register {
							emailBody = '''\
Hi $user.username,<br/>
<br/>
You (or someone pretending to be you) created an account with this email address.<br/>
<br/>
If you made the request, please click&nbsp;<a href="$url">here</a> to finish the registration.
'''
							emailFrom = 'zhijun_xiong@fpi-inc.com'
							emailSubject = 'New Account'
							defaultRoleNames = ['ROLE_USER']
							postRegisterUrl = null // use defaultTargetUrl if not set
					}
	
					forgotPassword {
							emailBody = '''\
Hi $user.username,<br/>
<br/>
You (or someone pretending to be you) requested that your password be reset.<br/>
<br/>
If you didn't make this request then ignore the email; no changes have been made.<br/>
<br/>
If you did make the request, then click <a href="$url">here</a> to reset your password.
'''
							emailFrom = 'do.not.reply@localhost'
							emailSubject = 'Password Reset'
							postResetUrl = null // use defaultTargetUrl if not set
					}
			}
	}
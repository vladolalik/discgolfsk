<?php $this->load->view('header', array('title' => 'Upload picture' )); ?>
<h1>Change Profile Picture</h1>
	<?php echo $error;?>
	<?php echo form_open_multipart('auth/do_upload');?>
	<input type="file" name="userfile" size="20" />
	<input type="submit" value="Upload New Picture" />
</form>
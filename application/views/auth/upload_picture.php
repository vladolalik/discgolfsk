<?php $this->load->view('header', array('title' => 'Upload picture', 'caption' => 'Change profile picture')); ?>
	<?php echo $error;?>
	<?php echo form_open_multipart('auth/do_upload');?>
	<input type="file" name="userfile" size="20" />
	<input type="submit" value="Upload New Picture" />
</form>
<?php $this->load->view('header', array('title' => 'Upload picture', 'caption' => 'Change profile picture')); ?>
	<?php echo $error;?>
	<?php echo form_open_multipart('auth/do_upload');?>
	<div class="form-group">
		<input type="file" name="userfile" size="20" />
	</div>
	<div class="form-group">
		<input type="submit" value="Upload New Picture" />
	</div>
</form>